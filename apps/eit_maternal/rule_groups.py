from edc.constants import POS, NEG, IND

from edc.subject.registration.models import RegisteredSubject
from edc.subject.rule_groups.classes import (RuleGroup, site_rule_groups, ScheduledDataRule,
                                             Logic, RequisitionRule)
from edc.subject.appointment.models import Appointment

from .models import MaternalConsent


def func_maternal_lab(visit_instance):

    visit=['1000M']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.subject_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        return True
    return False


class MaternalLabRuleGroup(RuleGroup):

    """Ensures a Viral Load blood draw requisition for the right visits"""
    ctrl_vl = RequisitionRule(
        logic=Logic(
            predicate=func_maternal_lab,
            consequence='new',
            alternative='none'),
        target_model=[('eit_lab', 'maternalrequisition')],
        target_requisition_panels=['Viral Load', ], )

    """Ensures a CD4 blood draw requisition for the right visits"""
    ctrl_cd4 = RequisitionRule(
        logic=Logic(
            predicate=func_maternal_lab,
            consequence='new',
            alternative='none'),
        target_model=[('eit_lab', 'maternalrequisition')],
        target_requisition_panels=['CD4 (ARV)', ], )

    """Ensures a PBMC blood draw requisition for the right visits"""
    ctrl_pbmc = RequisitionRule(
        logic=Logic(
            predicate=func_maternal_lab,
            consequence='new',
            alternative='none'),
        target_model=[('eit_lab', 'maternalrequisition')],
        target_requisition_panels=['PBMC Plasma (STORE ONLY)', ], )


    class Meta:
        app_label = 'eit_maternal'
        source_fk = None
        source_model = RegisteredSubject
site_rule_groups.register(MaternalLabRuleGroup)