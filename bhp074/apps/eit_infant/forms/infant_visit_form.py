from django import forms
from django.contrib.admin.widgets import AdminRadioSelect, AdminRadioFieldRenderer

from ..choices import VISIT_REASON
from ..models import InfantVisit

from edc.base.form.forms import BaseModelForm


class InfantVisitForm (BaseModelForm):

    """Based on model maternal_visit.

    Attributes reason and info_source override those from the base model so that
    the choices can be custom for this app.

    """

    reason = forms.ChoiceField(
        label='Reason for visit',
        choices=[choice for choice in VISIT_REASON],
        help_text=("If 'unscheduled', information is usually " +
                   "reported at the next scheduled visit, " +
                   "but exceptions may arise"),
        widget=AdminRadioSelect(renderer=AdminRadioFieldRenderer),
    )
#     info_source = forms.ChoiceField(
#         label='Source of information',
#         choices=[choice for choice in VISIT_INFO_SOURCE],
#         widget=AdminRadioSelect(renderer=AdminRadioFieldRenderer),
#         )

    def clean(self):

        cleaned_data = self.cleaned_data
        return cleaned_data

    class Meta:
        model = InfantVisit
