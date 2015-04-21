import re

from edc.dashboard.subject.classes import RegisteredSubjectDashboard
from edc.lab.lab_clinic_api.classes import EdcLabResults
from edc.subject.registration.models import RegisteredSubject


class DashboardMixin(object):

    def get_context_data(self, **kwargs):
        self.context = super(DashboardMixin, self).get_context_data(**kwargs)
        self.context.update(scheduled_lab_bucket=True)
        return self.context
