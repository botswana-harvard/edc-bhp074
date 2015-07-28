from django.core.exceptions import ValidationError
from django.core.urlresolvers import reverse
from django.db import models

from edc.audit.audit_trail import AuditTrail
from edc.entry_meta_data.helpers import ScheduledEntryMetaDataHelper, RequisitionMetaDataHelper
from edc.entry_meta_data.models import ScheduledEntryMetaData, RequisitionMetaData
from edc.subject.appointment.constants import IN_PROGRESS, DONE, INCOMPLETE, NEW
from edc.subject.entry.models import Entry, LabEntry
from edc.subject.registration.models import RegisteredSubject
from edc.subject.rule_groups.classes import site_rule_groups
from edc.subject.visit_tracking.models.base_visit_tracking import BaseVisitTracking
from edc.subject.visit_tracking.settings import VISIT_REASON_NO_FOLLOW_UP_CHOICES, VISIT_REASON_FOLLOW_UP_CHOICES

from apps.eit.choices import INFO_PROVIDER
from apps.eit_infant.choices import VISIT_REASON
# from bhp074.apps.eit_lab.models.panel import Panel


class InfantVisit(BaseVisitTracking):

#     information_provider = models.CharField(
#         verbose_name="Please indicate who provided most of the information for this child's visit",
#         choices=INFO_PROVIDER,
#         max_length=20,
#         help_text="",
#         )

#     information_provider_other = models.CharField(
#         verbose_name=" if information provider is Other, please specify",
#         max_length=20,
#         help_text="",
#         blank=True,
#         null=True,
#         )

#     study_status = models.CharField(
#         verbose_name="What is the participant's current study status",
#         max_length=50,
#         choices=INFANT_VISIT_STUDY_STATUS,
#         )
    #additional v2 fields
#     survival_status = models.CharField(
#         max_length=10,
#         verbose_name="Survival status",
#         choices=ALIVE_DEAD_UNKNOWN,
#         null=True,
#         blank=False)

#     date_last_alive = models.DateField(
#         verbose_name="Date last known alive",
#         help_text="",
#         null=True,
#         blank=True
#         )

    history = AuditTrail()

    objects = models.Manager()

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
