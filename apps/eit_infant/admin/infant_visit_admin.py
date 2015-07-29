from django.contrib import admin

from edc.subject.appointment.admin import BaseAppointmentModelAdmin

from ..models import InfantVisit
from ..forms import InfantVisitForm


class InfantVisitAdmin(BaseAppointmentModelAdmin):

    form = InfantVisitForm
    dashboard_type = 'infant'

    list_filter = ('created',)

    search_fields = (
        'appointment__registered_subject__subject_identifier',
        'appointment__registered_subject__registration_identifier',
        'appointment__registered_subject__first_name',
        'appointment__registered_subject__identity',
    )

    fields = (
        "appointment",
        "report_datetime",
        "reason",
        "reason_missed",
        "comments"
    )

admin.site.register(InfantVisit, InfantVisitAdmin)
