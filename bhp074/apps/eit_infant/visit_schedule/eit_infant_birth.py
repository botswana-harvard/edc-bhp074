from collections import OrderedDict

from edc.subject.visit_schedule.classes import VisitScheduleConfiguration, site_visit_schedules, EntryTuple, MembershipFormTuple, ScheduleGroupTuple, RequisitionPanelTuple
from edc.constants import REQUIRED, NOT_REQUIRED, ADDITIONAL, NOT_ADDITIONAL

from apps.eit_infant.models import InfantVisit, InfantBirth


class EitInfantBirthVisitSchedule(VisitScheduleConfiguration):

    name = 'birth visit schedule'
    app_label = 'eit_infant'
    # membership forms
    # (name, model, visible)
    membership_forms = OrderedDict({
        'infant_birth_record': MembershipFormTuple('infant_birth_record', InfantBirth, True),
        })

    # schedule groups
    # (name, membership_form_name, grouping_key, comment)
    schedule_groups = OrderedDict({
        'Infant Birth': ScheduleGroupTuple('Infant Birth', 'infant_birth_record', None, None),
        })

    # visit_schedule
    # see edc.subject.visit_schedule.models.visit_defintion
    visit_definitions = OrderedDict()
    visit_definitions['1000'] = {
            'title': 'Infant Enrollment Visit',
            'time_point': 0,
            'base_interval': 0,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
 
            )}

    visit_definitions['1001'] = {
            'title': 'Enrollment Visit',
            'time_point': 10,
            'base_interval': 1*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (

            )}
    visit_definitions['1002'] = {
            'title': 'Infant 2 Weeks Visit',
            'time_point': 20,
            'base_interval': 2*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}

    visit_definitions['1003'] = {
            'title': 'Infant 3 Weeks Visit',
            'time_point': 30,
            'base_interval': 3*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1004'] = {
            'title': 'Infant 4 Weeks Visit',
            'time_point': 40,
            'base_interval': 4*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1005'] = {
            'title': 'Infant 5 Weeks Visit',
            'time_point': 50,
            'base_interval': 5*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1006'] = {
            'title': 'Infant 6 Weeks Visit',
            'time_point': 60,
            'base_interval': 6*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1008'] = {
            'title': 'Infant 8 Weeks Visit',
            'time_point': 80,
            'base_interval': 8*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1012'] = {
            'title': 'Infant 12 Weeks Visit',
            'time_point': 120,
            'base_interval': 12*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1024'] = {
            'title': 'Infant 24 Weeks Visit',
            'time_point': 240,
            'base_interval': 24*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1036'] = {
            'title': 'Infant 36 Weeks Visit',
            'time_point': 360,
            'base_interval': 36*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1048'] = {
            'title': 'Infant 48 Weeks Visit',
            'time_point': 480,
            'base_interval': 48*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1060'] = {
            'title': 'Infant 60 Weeks Visit',
            'time_point': 600,
            'base_interval': 60*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1072'] = {
            'title': 'Infant 72 Weeks Visit',
            'time_point': 720,
            'base_interval': 72*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1084'] = {
            'title': 'Infant 84 Weeks Visit',
            'time_point': 840,
            'base_interval': 84*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1096'] = {
            'title': 'Infant 96 Weeks Visit',
            'time_point': 960,
            'base_interval': 96*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1108'] = {
            'title': 'Infant 108 Weeks Visit',
            'time_point': 1080,
            'base_interval': 108*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1120'] = {
            'title': 'Infant 120 Weeks Visit',
            'time_point': 1200,
            'base_interval': 120*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1132'] = {
            'title': 'Infant 132 Weeks Visit',
            'time_point': 1320,
            'base_interval': 132*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1144'] = {
            'title': 'Infant 144 Weeks Visit',
            'time_point': 1440,
            'base_interval': 144*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1156'] = {
            'title': 'Infant 156 Weeks Visit',
            'time_point': 1560,
            'base_interval': 156*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1168'] = {
            'title': 'Infant 168 Weeks Visit',
            'time_point': 1680,
            'base_interval': 168*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1180'] = {
            'title': 'Infant 180 Weeks Visit',
            'time_point': 1800,
            'base_interval': 180*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}
    visit_definitions['1192'] = {
            'title': 'Infant 192 Weeks Visit',
            'time_point': 1920,
            'base_interval': 192*7,
            'base_interval_unit': 'D',
            'window_lower_bound': 0,
            'window_lower_bound_unit': 'D',
            'window_upper_bound': 0,
            'window_upper_bound_unit': 'D',
            'grouping': 'infant',
            'visit_tracking_model': InfantVisit,
            'schedule_group': 'Infant Birth',
            'instructions': None,
            'requisitions': (
                #(entry_order, app_label, model_name, requisition_panel_name, panel_type, aliquot_type_alpha_code, form_visible)
                RequisitionPanelTuple(100L, u'eit_lab', u'infantrequisition', 'DNA PCR', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(200L, u'eit_lab', u'infantrequisition', 'Plasma and Buffy Coat Storage', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(300L, u'eit_lab', u'infantrequisition', 'Hematology (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(400L, u'eit_lab', u'infantrequisition', 'ELISA', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
#                 RequisitionPanelTuple(500L, u'eit_lab', u'infantrequisition', 'Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(550L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry NON-LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(580L, u'eit_lab', u'infantrequisition', 'BHP074 Chemistry LPV', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(600L, u'eit_lab', u'infantrequisition', 'Viral Load', 'TEST', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(700L, u'eit_lab', u'infantrequisition', 'PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(800L, u'eit_lab', u'infantrequisition', 'Pharmacokinetics', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                RequisitionPanelTuple(900L, u'eit_lab', u'infantrequisition', 'CD4 (ARV)', 'STORAGE', 'WB', NOT_REQUIRED, ADDITIONAL),
                ),
            'entries': (
            )}

site_visit_schedules.register(EitInfantBirthVisitSchedule)
