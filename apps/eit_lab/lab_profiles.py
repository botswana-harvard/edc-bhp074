from edc.lab.lab_profile.classes import site_lab_profiles

from edc.lab.lab_profile.classes import LabProfile

from .models import Aliquot, AliquotType, Receive, MaternalRequisition, InfantRequisition, AliquotProfile, AliquotProfileItem, Panel


class BaseEitProfile(LabProfile):
    aliquot_model = Aliquot
    aliquot_type_model = AliquotType
    panel_model = Panel
    receive_model = Receive
    profile_model = AliquotProfile
    profile_item_model = AliquotProfileItem


class EitMaternalProfile(BaseEitProfile):
    requisition_model = MaternalRequisition
    name = MaternalRequisition._meta.object_name
site_lab_profiles.register(EitMaternalProfile)


class EitInfantProfile(BaseEitProfile):
    requisition_model = InfantRequisition
    name = InfantRequisition._meta.object_name
site_lab_profiles.register(EitInfantProfile)
