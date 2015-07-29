from django import forms

from edc.subject.consent.forms import BaseConsentedModelForm

from ..models import MaternalPostReg


class MaternalPostRegForm (BaseConsentedModelForm):
    def clean(self):

        cleaned_data = self.cleaned_data
        if cleaned_data.get('live_infants_to_register') > 1:
            raise forms.ValidationError('Can only register 1 infant.')
        return self.cleaned_data

    class Meta:
        model = MaternalPostReg
