from collections import OrderedDict

from edc.export.actions import export_as_csv_action
from edc.subject.registration.admin import BaseRegisteredSubjectModelAdmin


class RegisteredSubjectModelAdmin (BaseRegisteredSubjectModelAdmin):
    """ModelAdmin subclass for models with a ForeignKey to 'registered_subject'"""
    dashboard_type = 'infant'

    actions = [export_as_csv_action(description="CSV Export of registered_subject",
        fields=[],
        delimiter=',',
        exclude=['created', 'modified', 'user_created', 'user_modified', 'revision', 'id', 'hostname_created', 'hostname_modified' ],
        extra_fields=OrderedDict(
            {'subject_identifier': 'registered_subject__subject_identifier',
             'gender': 'registered_subject__gender',
             'dob': 'registered_subject__dob',
             'registered': 'registered_subject__registration_datetime'}),
        )]
