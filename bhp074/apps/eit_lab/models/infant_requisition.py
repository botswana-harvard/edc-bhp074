from django.core.urlresolvers import reverse
from django.db import models

from edc.entry_meta_data.managers import RequisitionMetaDataManager
from edc.lab.lab_requisition.models import BaseRequisition
from edc_base.audit_trail import AuditTrail
from edc_base.model.models.base_uuid_model import BaseUuidModel

from bhp074.apps.eit_infant.models import InfantVisit

from ..managers import RequisitionManager

from .packing_list import PackingList
from .panel import Panel
from .aliquot_type import AliquotType


class InfantRequisition(BaseRequisition, BaseUuidModel):

    infant_visit = models.ForeignKey(InfantVisit)

    packing_list = models.ForeignKey(PackingList, null=True, blank=True)

    aliquot_type = models.ForeignKey(AliquotType)

    panel = models.ForeignKey(Panel)

    objects = RequisitionManager()

    history = AuditTrail()

    entry_meta_data_manager = RequisitionMetaDataManager(InfantVisit)

    def get_visit(self):
        return self.infant_visit

    def aliquot(self):
        url = reverse('admin:eit_lab_aliquot_changelist')
        return """<a href="{url}?q={requisition_identifier}" />aliquot</a>""".format(
            url=url, requisition_identifier=self.requisition_identifier
        )
    aliquot.allow_tags = True

    class Meta:
        app_label = 'eit_lab'
        verbose_name = 'Infant Laboratory Requisition'
        unique_together = ('infant_visit', 'panel', 'is_drawn')
