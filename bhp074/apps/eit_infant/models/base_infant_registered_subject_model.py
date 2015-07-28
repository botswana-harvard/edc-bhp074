from django.db import models, IntegrityError

from edc.subject.registration.models import BaseRegisteredSubjectModel

from .infant_visit import InfantVisit


class BaseInfantRegisteredSubjectModel(BaseRegisteredSubjectModel):

    def safe_delete_appointment(self, code):
        """Deletes an appointment as long as the visit tracking form does not exist."""
        Appointment = models.get_model('appointment', 'Appointment')
        for appointment in Appointment.objects.filter(registered_subject=self.registered_subject, visit_definition__code=code, visit_instance='0'):
            if not InfantVisit.objects.filter(appointment=appointment):
                try:
                    appointment.delete()
                except IntegrityError:
                    pass

    def get_report_datetime(self):
        return self.get_registration_datetime()

    def get_visit(self):
        return self.infant_visit

    class Meta:
        abstract = True
