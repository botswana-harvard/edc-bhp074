from lis.specimen.lab_aliquot_list.models import BaseAliquotType
from lis.specimen.lab_aliquot_list.managers import AliquotTypeManager

from edc_base.model.models import BaseUuidModel


class AliquotType(BaseAliquotType, BaseUuidModel):

    objects = AliquotTypeManager()

    class Meta:
        app_label = 'eit_lab'
        ordering = ["name"]
