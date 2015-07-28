from collections import OrderedDict

from edc.core.bhp_common.utils import convert_from_camel
from edc.dashboard.subject.classes import RegisteredSubjectDashboard
from edc.subject.registration.models import RegisteredSubject

from apps.eit_infant.models import InfantBirth
from apps.eit_lab.models import MaternalRequisition, PackingList
from apps.eit_maternal.models import MaternalConsent, MaternalVisit

from .dashboard_mixin import DashboardMixin


class MaternalDashboard(DashboardMixin, RegisteredSubjectDashboard):

    view = 'maternal_dashboard'
    dashboard_name = 'Maternal Dashboard'
    dashboard_url_name = 'subject_dashboard_url'
    urlpatterns = [
        RegisteredSubjectDashboard.urlpatterns[0][:-1] + '(?P<appointment_code>{appointment_code})/$'
        ] + RegisteredSubjectDashboard.urlpatterns
    urlpattern_options = dict(
        RegisteredSubjectDashboard.urlpattern_options,
        dashboard_model=RegisteredSubjectDashboard.urlpattern_options['dashboard_model'] + '|maternal_consent|maternal_eligible_postnatal',
        dashboard_type='maternal',
        appointment_code='|1000M')

    template_name = 'maternal_dashboard.html'

    def __init__(self, *args, **kwargs):
        super(MaternalDashboard, self).__init__(*args, **kwargs)
        self.visit_model = MaternalVisit
        self.dashboard_type_list = ['maternal']
        self.dashboard_models['maternal_consent']  = MaternalConsent
        self.membership_form_category= ['maternal_eligible_postnatal']
        self._locator_model = None
        self._requisition_model = MaternalRequisition

    def get_context_data(self, **kwargs):
        self.context = super(MaternalDashboard, self).get_context_data(**kwargs)
        self.context.update(
            home='eit',
            infants=self.get_infants(),
            search_name='maternal',
            infant_dashboard_url=self.get_infant_dashboard_url(),
            title='Maternal Dashboard',
            delivery_datetime=self.get_delivery_datetime(),
            maternal_consent=self.consent
            )
        return self.context

    @property
    def consent(self):
        self._consent = None
        try:
            self._consent = MaternalConsent.objects.get(id=self.dashboard_id)
        except MaternalConsent.DoesNotExist:
            if self.appointment:
                self._consent = MaternalConsent.objects.get(registered_subject=self.appointment.registered_subject)
        return self._consent

    @property
    def registered_subject(self):
        if not self._registered_subject:
            #pass
            try:
                self._registered_subject = RegisteredSubject.objects.get(pk=self.dashboard_id)
            except RegisteredSubject.DoesNotExist:
                try:
                    self._registered_subject = RegisteredSubject.objects.get(subject_identifier=self.subject_identifier)
                except RegisteredSubject.DoesNotExist:
                    try:
                        self._registered_subject = self.appointment.registered_subject
                    except AttributeError:
                        pass
        return self._registered_subject

    @property
    def subject_identifier(self):
        self._subject_identifier = None
        if self.consent:
            self._subject_identifier = self.consent.subject_identifier
        else:
            pass
        return self._subject_identifier

    def get_delivery_datetime(self):
        return None

    def set_membership_form_category(self, category):
        self._membership_form_category = 'maternal'

    def get_infant_dashboard_url(self):
        return 'subject_dashboard_url'

    def set_dashboard_type_list(self):
        self._dashboard_type_list = ['maternal']

    def get_subject_identifier(self):
        return self.subject_identifier

    def get_visit_model(self):
        return MaternalVisit

    def get_requisition_model(self):
        return MaternalRequisition

    def get_packing_list_model(self):
        return PackingList

    def get_infants(self):
        """Returns a list of infants identifiers asssociated with the maternal subject_identifier by querying the Birth model or RegisteredSubject."""
        infants = OrderedDict()
        for infant_registered_subject in RegisteredSubject.objects.filter(subject_type='infant', relative_identifier__iexact=self.subject_identifier):
            #look for infant birth record
            if InfantBirth.objects.filter(registered_subject__exact=infant_registered_subject).exists():
                infant_birth = InfantBirth.objects.get(registered_subject__exact=infant_registered_subject)
                dct = infant_birth.__dict__
                dct['dashboard_model'] = convert_from_camel(infant_birth._meta.object_name)
                dct['dashboard_id'] = convert_from_camel(infant_birth.pk)
                dct['dashboard_type'] = 'infant'
                infants[infant_registered_subject.subject_identifier] = dct
            else:
                dct = {'subject_identifier': infant_registered_subject.subject_identifier}
                dct['dashboard_model'] = 'registered_subject'
                dct['dashboard_id'] = infant_registered_subject.pk
                dct['dashboard_type'] = 'infant'
                infants[infant_registered_subject.subject_identifier] = dct
        return infants

    def subject_hiv_status(self):
        return 'POS'
