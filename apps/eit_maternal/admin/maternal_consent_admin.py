from django.contrib import admin
from collections import OrderedDict

from edc.export.actions import export_as_csv_action
from edc.subject.consent.admin import BaseConsentModelAdmin, BaseConsentUpdateModelAdmin, BaseConsentUpdateInlineAdmin
from edc.subject.registration.models import RegisteredSubject

from ..models import MaternalConsent
from ..forms import MaternalConsentForm


class MaternalConsentAdmin(BaseConsentModelAdmin):

    form = MaternalConsentForm

    def __init__(self, *args, **kwargs):
        super(MaternalConsentAdmin, self).__init__(*args, **kwargs)
        # remove these fields from admin fields list, default values should apply
        for fld in ['witness_name', 'is_literate', 'guardian_name', 'is_incarcerated',
                     'language', 'confirm_identity', 'may_store_samples', 'consent_reviewed',
                     'study_questions', 'assessment_score', 'consent_copy', 'identity_type',
                     'comment', 'is_dob_estimated', 'gender']:
            self.fields.remove(fld)
        for fld in ["cohort",]:
            self.fields.append(fld)

    radio_fields = {
        "cohort": admin.VERTICAL,
        }

    def save_model(self, request, obj, form, change):
        """Saves and randomizes."""
        if not change:
            obj.may_store_samples = 'Yes'
            obj.is_incarcerated = 'No'
            obj.is_literate = 'No'
            obj.language = 'tn'
            obj.is_verified = True
            obj.confirm_identity = obj.identity
            obj.identity_type = 'OMANG'
            obj.gender = 'F'
        return super(MaternalConsentAdmin, self).save_model(request, obj, form, change)



#     actions = [export_as_csv_action(description="CSV Export of Maternal Consent",
#         fields=[],
#         delimiter=',',
#         exclude=['created', 'modified', 'user_created', 'user_modified', 'revision', 'id', 'hostname_created', 'hostname_modified', 'last_name', 'identity', 'confirm_identity', 'first_name' ],
#         extra_fields=OrderedDict(
#             {'subject_identifier': 'registered_subject__subject_identifier',
#              'gender': 'registered_subject__gender',
#              'dob': 'registered_subject__dob',
#              'registered': 'registered_subject__registration_datetime'})
#         )]

admin.site.register(MaternalConsent, MaternalConsentAdmin)
