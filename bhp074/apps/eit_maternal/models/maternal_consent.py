from django.db import models
from django.core.urlresolvers import reverse

from edc.audit.audit_trail import AuditTrail
from edc.subject.registration.models import RegisteredSubject
from edc.subject.consent.models import BaseConsent
from edc.subject.consent.mixins.bw import IdentityFieldsMixin
from edc.subject.consent.mixins import ReviewAndUnderstandingFieldsMixin

from .base_maternal_consent import BaseMaternalConsent

from ..choices import COHORT


class MaternalConsent(BaseMaternalConsent):

    """Model for maternal consent and registration model for mothers."""

    history = AuditTrail()

    registered_subject = models.OneToOneField(RegisteredSubject,
        editable=False,
        null=True,
        help_text='')

    cohort = models.CharField(
        verbose_name="Cohort",
        max_length=15,
        choices=COHORT,
        )

    def save_new_consent(self, using=None, subject_identifier=None):
        from edc.core.identifier.models import SubjectIdentifier
        from edc.core.identifier.classes import CheckDigit

        check = CheckDigit()
        protocol = '074'
        m_indicator = "2"
        prefix = 'M'

        if self.cohort=='antepartum':
            cohort_id=10
            prev_id = SubjectIdentifier.objects.filter(device_id=cohort_id).order_by('-sequence_number')
            if prev_id:
                seq = prev_id[0].sequence_number+1
            else:
                seq = 101
        elif self.cohort=='peripartum':
            cohort_id=20
            prev_id = SubjectIdentifier.objects.filter(device_id=cohort_id).order_by('-sequence_number')
            if prev_id:
                seq = prev_id[0].sequence_number+1
            else:
                seq = 201
        else:
            prefix='C'
            cohort_id=30
            prev_id = SubjectIdentifier.objects.filter(device_id=cohort_id).order_by('-sequence_number')
            if prev_id:
                seq = prev_id[0].sequence_number+1
            else:
                seq = 301
        check_digit = check.calculate(int(protocol+str(seq)+m_indicator), modulus=7)
        subject_identifier = protocol+"-"+prefix+"-"+str(seq)+"-"+m_indicator+"-"+str(check_digit)
        identifier = SubjectIdentifier(padding=3, sequence_number=seq, identifier=subject_identifier, device_id=cohort_id,sequence_model_name='maternalconsent', sequence_app_label='eit_maternal')
        identifier.save(bypass=True)
        return subject_identifier

    def get_registered_subject(self):
        return self.registered_subject

    def update_registered_subject_on_post_save(self, using, **kwargs):
        if not self.registered_subject:
            subject = RegisteredSubject.objects.filter(subject_identifier=self.subject_identifier)
            if subject:
                self.registered_subject=subject[0]
                self.save(using=using)

    def dispatch_container_lookup(self):
        return None

    @classmethod
    def get_consent_update_model(self):
        return models.get_model('bhp_consent', 'MaternalConsentUpdate')

    def get_absolute_url(self):
        return reverse('admin:mpepu_maternal_maternalconsent_change', args=(self.id,))

    class Meta:
        verbose_name = "Maternal Consent"
        app_label = 'eit_maternal'
