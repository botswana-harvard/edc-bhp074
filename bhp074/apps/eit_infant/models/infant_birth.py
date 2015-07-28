from django.core.exceptions import ImproperlyConfigured, ValidationError
from django.core.validators import MinValueValidator, MaxValueValidator
from django.conf import settings
from django.db import models, IntegrityError

from datetime import datetime

from edc.audit.audit_trail import AuditTrail
from edc.base.model.fields.custom.custom_fields import InitialsField
from edc.base.model.validators import date_not_future
from edc.base.model.validators import datetime_not_before_study_start, datetime_not_future, datetime_is_after_consent
from edc.choices.common import GENDER_UNDETERMINED
from edc.core.crypto_fields.fields import EncryptedFirstnameField
from edc.subject.consent.classes import ConsentHelper
from edc.subject.registration.models import BaseRegisteredSubjectModel
from edc.subject.appointment.models import Appointment

from apps.eit_maternal.models import MaternalConsent

from ..models import InfantVisit


class InfantBirth(BaseRegisteredSubjectModel):

    """MP008 - Infant Birth Record """

    first_name = EncryptedFirstnameField(
        #max_length = 250,
        verbose_name="Infant's first name",
        help_text="If infant name is unknown or not yet determined, use Baby + birth order + mother's last name, e.g. 'Baby1Malane'")
    initials = InitialsField()
    birth_order = models.IntegerField(
        verbose_name='Birth Order',
        help_text="For example, 1, 2, 3, .... Is also implied by infant identifier suffix.",
        default=1,
        validators=[MinValueValidator(1), MaxValueValidator(4), ])
    dob = models.DateField(
        verbose_name='Date of Birth',
        validators=[date_not_future, ],
        help_text="Must match labour and delivery report.")
    gender = models.CharField(
        max_length=10,
        choices=GENDER_UNDETERMINED)
    infant_redcap_sbid = models.CharField(
        verbose_name="Infant Red Cap Screening Bid",
        max_length=50,
        blank=True,
        null=True,
        )
    objects = models.Manager()
    history = AuditTrail()

    @property
    def maternal_identifier(self):
        pass

    def get_registration_datetime(self): 
        return datetime.today()

    def get_consenting_subject_identifier(self):
        """Returns mother's identifier."""
        return self.registered_subject.relative_identifier

    def get_current_consent_version(self):
        """Confirms subject has a consent that covers data entry for this model."""
        return ConsentHelper(self).get_current_consent_version()

    def __unicode__(self):
        return '%s [%s] %s %s' % (self.registered_subject.subject_identifier, self.initials, self.dob, self.get_gender_display())

    def get_date_grouping_field(self):
        #set field for date-based grouping
        return 'dob'

    def safe_delete_appointment(self, code):
        """Deletes an appointment as long as the visit tracking form does not exist."""
        Appointment = models.get_model('appointment', 'Appointment')
        for appointment in Appointment.objects.filter(registered_subject=self.registered_subject, visit_definition__code=code, visit_instance='0'):
            if not InfantVisit.objects.filter(appointment=appointment):
                try:
                    appointment.delete()
                except IntegrityError:
                    pass

    def delete_control_apps_post_save(self):
        maternal_subject = MaternalConsent.objects.get(registered_subject__subject_identifier=self.registered_subject.relative_identifier)
        if maternal_subject.cohort == 'control':
            appointments = Appointment.objects.filter(registered_subject=self.registered_subject)
            for ap in appointments:
                if ap.visit_definition.code != '1000':
                    ap.delete()

    def get_report_datetime(self):
        return self.get_registration_datetime()

    def get_visit(self):
        return self.infant_visit

    class Meta:
        app_label = "eit_infant"
        verbose_name = "Infant Birth Record"

