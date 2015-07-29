from django.contrib import admin

from edc.subject.registration.admin import BaseRegisteredSubjectModelAdmin

from ..forms import MaternalPostRegForm
from ..models import MaternalPostReg


class MaternalPostRegAdmin(BaseRegisteredSubjectModelAdmin):
    form = MaternalPostRegForm

    fields = (
        "registered_subject",
        "delivery_datetime",
        "live_infants_to_register",
    )
admin.site.register(MaternalPostReg, MaternalPostRegAdmin)
