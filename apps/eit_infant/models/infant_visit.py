from django.core.urlresolvers import reverse
from django.db import models

from edc.audit.audit_trail import AuditTrail
from edc.subject.visit_tracking.models.base_visit_tracking import BaseVisitTracking

from apps.eit_infant.choices import VISIT_REASON


class InfantVisit(BaseVisitTracking):

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
