from django.contrib import admin

from ..forms import InfantBirthForm
from ..models import InfantBirth

from .registered_subject_model_admin import RegisteredSubjectModelAdmin


class InfantBirthAdmin(RegisteredSubjectModelAdmin):

    form = InfantBirthForm

    def save_model(self, request, obj, form, change):

        # update initials, etc for register_subject record, now that you have them
        registered_subject = obj.registered_subject
        registered_subject.initials = obj.initials
        registered_subject.gender = obj.gender
        registered_subject.dob = obj.dob
        registered_subject.is_dob_estimated = '-'
        registered_subject.save()
        return super(InfantBirthAdmin, self).save_model(request, obj, form, change)

    fields = (
        "registered_subject",
        "first_name",
        "initials",
        "birth_order",
        "dob",
        "gender",
        "infant_redcap_sbid",
    )

    list_display = ('registered_subject', 'first_name', 'initials', 'dob', 'gender', 'created', 'modified')

    radio_fields = {
        "gender": admin.VERTICAL
    }

    filter_horizontal = (

    )

    search_fields = ('registered_subject__subject_identifier', 'first_name', 'initials', 'registered_subject__sid',)

    list_filter = ('gender',)

admin.site.register(InfantBirth, InfantBirthAdmin)
