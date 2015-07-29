from django import forms
import re

from edc.subject.consent.forms import BaseSubjectConsentForm, BaseConsentUpdateForm

from ..models import MaternalConsent


class MaternalConsentForm (BaseSubjectConsentForm):

    def clean(self):

        cleaned_data = self.cleaned_data
        consent = MaternalConsent.objects.filter(identity=cleaned_data.get('identity'))
        if consent:
            raise forms.ValidationError("This identity number already exists")

        return cleaned_data

    class Meta:
        model = MaternalConsent
