import re

from edc.dashboard.subject.classes import RegisteredSubjectDashboard
from edc.lab.lab_clinic_api.classes import EdcLabResults
from edc.subject.registration.models import RegisteredSubject


class DashboardMixin(object):

#     @RegisteredSubjectDashboard.locator_model.getter
#     def locator_model(self):
#         return self.get_locator_model()

    def render_labs(self):
        if self._requisition_model:
            edc_lab_results = EdcLabResults()
            return edc_lab_results.results_template(self.subject_identifier, False)
        return ''

#     def add_to_context(self):
    def get_context_data(self, **kwargs):
        self.context = super(DashboardMixin, self).get_context_data(**kwargs)
        self.context.update(scheduled_lab_bucket=True)
        return self.context

#     @RegisteredSubjectDashboard.registered_subject.setter
#     def registered_subject(self, pk=None):
#         self._registered_subject = None
#         self.set_registered_subject(pk)
#         re_pk = re.compile('[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}')
#         if not self._registered_subject:
#             if not self._registered_subject and self.dashboard_model == RegisteredSubject:
#                 self._registered_subject = RegisteredSubject.objects.filter(pk=self.dashboard_id).order_by('-created')[0]
#             elif not self._registered_subject and 'get_registered_subject' in dir(self.dashboard_model):
#                 registered_subject = self.dashboard_model_instance.registered_subject or self.dashboard_model_instance.get_registered_subject()
#                 self._registered_subject = registered_subject
#             elif not self._registered_subject and re_pk.match(str(pk)):
#                 self._registered_subject = RegisteredSubject.objects.get(pk=pk)
#             elif not self._registered_subject and self.appointment:
#                 # can i get it from an appointment? TODO: is this even possible?
#                 self._registered_subject = self.appointment.registered_subject
#             elif self._registered_subject:
#                 if not isinstance(self._registered_subject, RegisteredSubject):
#                     raise TypeError('Expected instance of RegisteredSubject. See {0}'.format(self))
#             else:
#                 pass
#         if not self._registered_subject:
#             raise TypeError('Attribute \'_registered_subject\' may not be None. Perhaps add method registered_subject to the model {0}. See {1}'.format(self.dashboard_model, self))
