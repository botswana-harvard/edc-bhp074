from django.db import models

from edc.lab.lab_packing.models import BasePackingList

# from .infant_requisition import InfantRequisition
# from .maternal_requisition import MaternalRequisition
# from .aliquot import Aliquot


class PackingList(BasePackingList):
    @property
    def item_models(self):
        item_m = []
        item_m.append(models.get_model('eit_lab', 'InfantRequisition'))
        item_m.append(models.get_model('eit_lab', 'MaternalRequisition'))
        item_m.append(models.get_model('eit_lab', 'Aliquot'))
        return item_m

    @property
    def packing_list_item_model(self):
        return models.get_model('eit_lab', 'PackingListItem')

    class Meta:
        app_label = "eit_lab"
        verbose_name = 'Packing List'
