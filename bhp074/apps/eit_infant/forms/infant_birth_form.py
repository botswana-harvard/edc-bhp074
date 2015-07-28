from django import forms
import re

from edc.subject.registration.models import RegisteredSubject
from edc.base.form.forms import BaseModelForm
from edc.subject.consent.forms import BaseConsentedModelForm

from apps.eit_infant.models import InfantBirth
from apps.eit_maternal.models import MaternalPostReg, MaternalConsent


class InfantBirthForm (BaseModelForm):

    def sbid_check(self):
        from edc.core.identifier.classes import CheckDigit

        maternal_subject = MaternalConsent.objects.get(registered_subject__subject_identifier=self.cleaned_data.get('registered_subject').relative_identifier)
        if maternal_subject.cohort != 'control':
            check = CheckDigit()
            screen_id = self.cleaned_data.get('infant_redcap_sbid')
            seq = int(screen_id[2:-8]+screen_id[-7:-3])
            check_digit = check.calculate(seq, modulus=97)
            if str(check_digit) != screen_id[-2:]:
                return True
        return False

    def clean(self):

        cleaned_data = self.cleaned_data
        consent = MaternalConsent.objects.get(subject_identifier=cleaned_data.get('registered_subject').relative_identifier)
        if consent.cohort != 'control' and not cleaned_data.get('infant_redcap_sbid'):
            raise forms.ValidationError('The screening BID is required for the {} cohort. Please fill it in'.format(consent.cohort))

        if MaternalPostReg.objects.filter(registered_subject__subject_identifier=cleaned_data.get('registered_subject').relative_identifier):
            delivery = MaternalPostReg.objects.get(registered_subject__subject_identifier=cleaned_data.get('registered_subject').relative_identifier)
            if not cleaned_data.get('dob', None) == delivery.delivery_datetime.date():
                raise forms.ValidationError('Infant dob must match maternal delivery date of %s. You wrote %s' % (delivery.delivery_datetime.date(), cleaned_data.get('dob', None),))
            if cleaned_data.get('infant_redcap_sbid'):
                birth = InfantBirth.objects.filter(infant_redcap_sbid=cleaned_data.get('infant_redcap_sbid'))
                if birth and birth[0].registered_subject != cleaned_data.get('registered_subject'):
                    raise forms.ValidationError('That Screening bid has already been used for participant {}'.format(birth.registered_subject.subject_identifier))
                match = re.search('S-\d{2}-\d{4}-\d{2}',cleaned_data.get('infant_redcap_sbid'))
                if not match:
                    raise forms.ValidationError('The Screening REDCAP Bid you provided does not conform to the presribed format for Screening Bids.')
        if self.sbid_check():
            raise forms.ValidationError('The checkdigit is not correct. Please check the Screening BID, and re-enter.')

        return cleaned_data

    class Meta:
        model = InfantBirth


