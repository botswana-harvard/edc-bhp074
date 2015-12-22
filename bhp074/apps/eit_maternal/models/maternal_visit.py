from django.core.urlresolvers import reverse
from django.db import models

from edc_base.audit_trail import AuditTrail
from edc_base.model.models.base_uuid_model import BaseUuidModel
from edc_visit_tracking.models import BaseVisitTracking
from edc_visit_tracking.constants import VISIT_REASON_NO_FOLLOW_UP_CHOICES

from ..choices import VISIT_REASON


class MaternalVisit(BaseVisitTracking, BaseUuidModel):

    """ Maternal visit form that links all follow-up forms """
    objects = models.Manager()

    history = AuditTrail()

    @property
    def registered_subject(self):
        return self.get_registered_subject()

    def __unicode__(self):
        return unicode(self.appointment)

    def get_visit_reason_choices(self):
        return VISIT_REASON

    def get_visit_reason_no_follow_up_choices(self):
        """Returns the visit reasons that do not imply any data collection; that is, the subject is not available."""
        dct = {}
        if self.appointment.visit_definition.code == '2180M':
            return dct
        else:
            for item in VISIT_REASON_NO_FOLLOW_UP_CHOICES:
                dct.update({item: item})
            dct.update({'vital status': 'vital status'})
            del dct['death']
            del dct['lost']
            return dct

    def save(self, *args, **kwargs):
        super(MaternalVisit, self).save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('admin:mpepu_maternal_maternalvisit_change', args=(self.id,))

    class Meta:
        verbose_name = "Maternal Visit"
        app_label = "eit_maternal"
