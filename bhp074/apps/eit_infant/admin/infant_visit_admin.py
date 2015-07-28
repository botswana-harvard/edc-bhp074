from django.contrib import admin
from collections import OrderedDict

from edc.export.actions import export_as_csv_action
from edc.subject.appointment.admin import BaseAppointmentModelAdmin

# from ...mpepu_lab.models import InfantRequisition
from ..models import InfantVisit
from ..forms import InfantVisitForm


class InfantVisitAdmin(BaseAppointmentModelAdmin):

    form = InfantVisitForm
    dashboard_type = 'infant'
#     requisition_model = InfantRequisition

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
#         "study_status",
#         "info_source",
#         "info_source_other",
#         "survival_status",
#         "date_last_alive",
#         "information_provider",
#         "information_provider_other",
        "comments"
        )

#     radio_fields = {
#         "study_status": admin.VERTICAL,
# #         "survival_status": admin.VERTICAL,
# #         "information_provider": admin.VERTICAL,
#         }

#     actions = [export_as_csv_action(description="CSV Export of registered_subject",
#         fields=[],
#         delimiter=',',
#         exclude=['created', 'modified', 'user_created', 'user_modified', 'revision', 'id', 'hostname_created', 'hostname_modified' ],
#         extra_fields=OrderedDict(
#             {'subject_identifier': 'appointment__registered_subject__subject_identifier',
#              'gender': 'appointment__registered_subject__gender',
#              'dob': 'appointment__registered_subject__dob',
#              'registered': 'appointment__registered_subject__registration_datetime'}),
#         )]

admin.site.register(InfantVisit, InfantVisitAdmin)
