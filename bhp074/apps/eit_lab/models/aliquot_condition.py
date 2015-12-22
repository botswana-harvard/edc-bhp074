from lis.specimen.lab_aliquot_list.managers import AliquotConditionManager
from lis.specimen.lab_aliquot_list.models import BaseAliquotCondition

from edc_base.model.models import BaseUuidModel


class AliquotCondition(BaseAliquotCondition, BaseUuidModel):

    objects = AliquotConditionManager()

    class Meta:
        app_label = 'eit_lab'
