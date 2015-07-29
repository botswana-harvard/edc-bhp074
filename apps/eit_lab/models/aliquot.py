from django.db import models
from django.core.exceptions import ValidationError
from django.core.urlresolvers import reverse

from edc.subject.registration.models import RegisteredSubject

from lis.specimen.lab_aliquot.managers import AliquotManager
from lis.specimen.lab_aliquot.models import BaseAliquot

from .aliquot_condition import AliquotCondition
from .aliquot_type import AliquotType
from .receive import Receive
from .infant_requisition import InfantRequisition
from .maternal_requisition import MaternalRequisition


class Aliquot(BaseAliquot):

    receive = models.ForeignKey(Receive,
        editable=False)

    aliquot_type = models.ForeignKey(AliquotType,
        verbose_name="Aliquot Type",
        null=True)

    aliquot_condition = models.ForeignKey(AliquotCondition,
        verbose_name="Aliquot Condition",
        null=True,
        blank=True)

    objects = AliquotManager()

    def save(self, *args, **kwargs):
        self.subject_identifier = self.receive.registered_subject.subject_identifier
        super(Aliquot, self).save(*args, **kwargs)

    @property
    def registered_subject(self):
        return self.receive.registered_subject

    @property
    def visit_code(self):
        return self.get_visit().appointment.visit_definition.code

    @property
    def specimen_identifier(self):
        return self.aliquot_identifier[:-4]

    def get_visit(self):
        from apps.eit_infant.models import InfantVisit
        visit = self.get_visit_model()
        if visit == InfantVisit:
            requisition = InfantRequisition.objects.get(requisition_identifier=self.aliquot_identifier[4:-4])
            return requisition.infant_visit
        else:
            requisition = MaternalRequisition.objects.get(requisition_identifier=self.aliquot_identifier[4:-4])
            return requisition.maternal_visit
        return visit

    def get_visit_model(self):
        from apps.eit_infant.models import InfantVisit
        from apps.eit_maternal.models import MaternalVisit
        registered_subject = RegisteredSubject.objects.get(subject_identifier=self.subject_identifier)
        if registered_subject.subject_type.lower() == 'infant':
            return InfantVisit
        else:
            return MaternalVisit

    def panel(self):
        registered_subject = RegisteredSubject.objects.get(subject_identifier=self.subject_identifier)
        if registered_subject.subject_type.lower() == 'infant':
            requisition = InfantRequisition.objects.get(
                requisition_identifier=self.receive.requisition_identifier
                )
        else:
            requisition = MaternalRequisition.objects.get(
                requisition_identifier=self.receive.requisition_identifier
                )
        aliquot_panel = requisition.panel
        return '{}'.format(aliquot_panel)
    panel.allow_tags = True

    def processing(self):
        url = reverse('admin:eit_lab_aliquotprocessing_add')
        return '<a href="{0}?aliquot={1}">process</a>'.format(url, self.pk)
    processing.allow_tags = True

    def related(self):
        url = reverse('admin:eit_lab_aliquot_changelist')
        return '<a href="{0}?q={1}">related</a>'.format(url, self.receive.receive_identifier)
    related.allow_tags = True

    class Meta:
        app_label = 'eit_lab'
        unique_together = (('receive', 'count'), )
        ordering = ('receive', 'count')
