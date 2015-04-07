from edc.constants import POS, NEG, IND

from edc.subject.registration.models import RegisteredSubject
from edc.subject.rule_groups.classes import (RuleGroup, site_rule_groups, ScheduledDataRule,
                                             Logic, RequisitionRule)
from edc.subject.appointment.models import Appointment

from ..eit_maternal.models import MaternalConsent

from .models import InfantVisit


def func_peripartum_hema(visit_instance):

    visit=['1000', '1004', '1024', '1048', '1096','1144', '1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'peripartum':
            return True
    return False

def func_peripartum_chem(visit_instance):

    visit=['1000', '1004', '1144', '1192']

#     maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
#         if maternal_id.cohort == 'peripartum':
        return True
    return False

def func_peripartum_vl(visit_instance):

    visit=['1000','1001', '1002', '1004', '1008', '1012', '1024', '1048', '1072', '1084', '1096', '1108', '1120', '1132', '1144', '1156', '1168', '1180','1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'peripartum':
            return True
    return False

def func_peripartum_pcr(visit_instance):

    visit=['1000', '1084']

#     maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
#         if maternal_id.cohort == 'peripartum':
        return True
    return False

def func_peripartum_cd4(visit_instance):

    visit=['1000', '1004', '1024', '1048', '1084', '1096', '1108', '1120', '1132', '1144', '1156', '1168', '1180','1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'peripartum':
            return True
    return False

def func_antepartum_hema(visit_instance):

    visit=['1000', '1002','1004', '1024', '1048', '1096','1144', '1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'antepartum':
            return True
    return False


def func_antepartum_vl(visit_instance):

    visit=['1000','1001', '1002', '1004', '1008', '1012', '1024', '1036', '1060','1084', '1096', '1108', '1120', '1132', '1144', '1156', '1168', '1180','1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'antepartum':
            return True
    return False

def func_antepartum_cd4(visit_instance):

    visit=['1000', '1004', '1012','1024', '1048', '1072','1084', '1096', '1108', '1120', '1132', '1144', '1156', '1168', '1180','1192']

    maternal_id = MaternalConsent.objects.get(subject_identifier=visit_instance.registered_subject.relative_identifier)

    if visit_instance.appointment.visit_definition.code in visit:
        if maternal_id.cohort == 'antepartum':
            return True
    return False


class PeripartumRuleGroup(RuleGroup):

    """Ensures a Hematology blood draw requisition for the right visits"""
    peri_hema = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_hema,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['Hematology (ARV)', ], )

    """Ensures a Chemistry blood draw requisition for the right visits"""
    peri_chem = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_chem,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['Chemistry NVP/LFT + ALPL6 (ARV)', ], )

    """Ensures a Viral Load blood draw requisition for the right visits"""
    peri_vl = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_vl,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['Viral Load', ], )

    """Ensures a DNA PCR blood draw requisition for the right visits"""
    peri_pcr = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_pcr,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['DNA PCR', ], )
    
    """Ensures a CD4 blood draw requisition for the right visits"""
    peri_cd4 = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_pcr,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['CD4 (ARV)', ], )

    class Meta:
        app_label = 'eit_infant'
        source_fk = None
        source_model = RegisteredSubject
site_rule_groups.register(PeripartumRuleGroup)


class AntepartumRuleGroup(RuleGroup):

    """Ensures a Hematology blood draw requisition for the right visits"""
    ante_hema = RequisitionRule(
        logic=Logic(
            predicate=func_antepartum_hema,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['Hematology (ARV)', ], )

    """Ensures a Viral Load blood draw requisition for the right visits"""
    ante_vl = RequisitionRule(
        logic=Logic(
            predicate=func_antepartum_vl,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['Viral Load', ], )
    
    """Ensures a CD4 blood draw requisition for the right visits"""
    peri_cd4 = RequisitionRule(
        logic=Logic(
            predicate=func_peripartum_pcr,
            consequence='new',
            alternative='not_required'),
        target_model=[('eit_lab', 'infantrequisition')],
        target_requisition_panels=['CD4 (ARV)', ], )

    class Meta:
        app_label = 'eit_infant'
        source_fk = None
        source_model = RegisteredSubject
site_rule_groups.register(AntepartumRuleGroup)