from datetime import datetime, time
from django.db import models
from django.core.urlresolvers import reverse

from edc.audit.audit_trail import AuditTrail
from edc.base.model.validators import datetime_not_future
from edc.core.identifier.classes import CheckDigit
from edc.core.identifier.classes import InfantIdentifier
from edc.subject.registration.models import BaseRegisteredSubjectModel
from edc.subject.registration.models import RegisteredSubject

from .maternal_consent import MaternalConsent


class MaternalPostReg(BaseRegisteredSubjectModel):

    """ Post-partum registration """

    reg_datetime = models.DateTimeField(default=datetime.today())

    delivery_datetime = models.DateTimeField(
        verbose_name="Date and time of delivery :",
        help_text="If TIME unknown, estimate",
        validators=[
            datetime_not_future, ],
        )

    live_infants_to_register = models.IntegerField(
        verbose_name="How many babies are registering to the study? ",
        help_text="",
        )

    history = AuditTrail()

    def get_registration_datetime(self):
        return self.reg_datetime

    def post_save_register_infants(self, created, **kwargs):
        """Registers infant(s) using the bhp_identifier class which allocates identifiers and creates registered_subject instances.

        Called on the post_save signal"""
        protocol="074"
        i_indicator = "1"
        check = CheckDigit()
        consent = MaternalConsent.objects.get(subject_identifier=self.registered_subject.subject_identifier)
        if created:
            seq = consent.subject_identifier[6:-4]
            check_digit = check.calculate(int(protocol+str(seq)+i_indicator), modulus=7)
            if consent.cohort=='antepartum':
                prefix = 'A'
            elif consent.cohort=='peripartum':
                prefix = "P"
            else:
                prefix = "C"
            new_identifier = protocol+"-"+prefix+"-"+str(seq)+"-"+i_indicator+"-"+str(check_digit)

            RegisteredSubject.objects.create(
                subject_identifier=new_identifier,
                registration_datetime=datetime.now(),
                subject_type='infant',
                user_created=self.user_created,
                created=datetime.now(),
                first_name='',
                initials='',
                registration_status='registered',
                relative_identifier=self.registered_subject.subject_identifier,
                study_site=consent.study_site)

        return new_identifier

    def __unicode__(self):
        return "{0} {1}".format(self.registered_subject, self.reg_datetime)

    def get_report_datetime(self):
        return self.reg_datetime

    def get_absolute_url(self):
        return reverse('admin:eit_maternal_maternalpostreg_change', args=(self.id,))

    class Meta:
        app_label = "eit_maternal"
        verbose_name = "Maternal Post Partum Registration"
