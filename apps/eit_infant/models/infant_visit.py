from django.core.urlresolvers import reverse
from django.db import models

from edc_base.audit_trail import AuditTrail
from edc_base.model.models.base_uuid_model import BaseUuidModel
from edc_visit_tracking.models import BaseVisitTracking

from apps.eit_infant.choices import VISIT_REASON


class InfantVisit(BaseVisitTracking, BaseUuidModel):

    objects = models.Manager()

    history = AuditTrail()

    def __unicode__(self):
        return unicode(self.appointment)

    def get_visit_reason_choices(self):
        return VISIT_REASON

    @property
    def registered_subject(self):
        return self.get_registered_subject()

    def get_absolute_url(self):
        return reverse('admin:mpepu_infant_infantvisit_change', args=(self.id,))

    def get_consenting_subject_identifier(self):
        """Returns mother's identifier."""
        return self.appointment.registered_subject.relative_identifier

    def save(self, *args, **kwargs):
        super(InfantVisit, self).save(*args, **kwargs)

    class Meta:
        db_table = 'eit_infant_infantvisit'
        app_label = "eit_infant"
        verbose_name = "Infant Visit"
