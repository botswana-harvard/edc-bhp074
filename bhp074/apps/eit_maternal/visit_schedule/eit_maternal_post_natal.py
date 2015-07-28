from collections import OrderedDict
from edc.constants import REQUIRED, NOT_REQUIRED, ADDITIONAL, NOT_ADDITIONAL

from edc.subject.visit_schedule.classes import (VisitScheduleConfiguration, site_visit_schedules, EntryTuple,
                                                 MembershipFormTuple, ScheduleGroupTuple, RequisitionPanelTuple)

from apps.eit_maternal.models import MaternalConsent, MaternalVisit, MaternalPostReg


class EitMaternalPostNatalVisitSchedule(VisitScheduleConfiguration):

    name = 'postnatal visit schedule'
    app_label = 'eit_maternal'
    membership_forms = OrderedDict({
        'maternal_eligible_postnatal': MembershipFormTuple('maternal_eligible_postnatal', MaternalPostReg, True),
        })

    schedule_groups = OrderedDict({
        'Maternal Post Partum Reg': ScheduleGroupTuple('Maternal Post Partum Reg', 'maternal_eligible_postnatal', 'ELIGIBILITY', None),
        })

    visit_definitions = OrderedDict()

    visit_definitions['1000M'] = {
            'title': 'Maternal Enrolment Visit',
            'time_point': 0,
            'base_interval': 0,
            'base_interval_unit': 'D',
            'window_lower_bound': 15,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 34,
            'window_upper_bound_unit': 'D',
            'grouping': 'maternal',
            'visit_tracking_model': MaternalVisit,
            'schedule_group': 'Maternal Post Partum Reg',
            'instructions': 'As of 2012-11-26, submit requisition for Viral Load (storage only) instead of PHS Ultrasensitive Viral Load (<50)',
            'requisitions': (
                #(entry_order, app_label, model_name, panel.name, panel.edc_name, panel.panel_type, aliquot_type)
                RequisitionPanelTuple(100L, u'eit_lab', u'maternalrequisition', 'CD4 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'maternalrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'maternalrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}

site_visit_schedules.register(EitMaternalPostNatalVisitSchedule)
