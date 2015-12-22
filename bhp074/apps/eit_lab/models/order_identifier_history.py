from edc.core.identifier.models import BaseIdentifierModel
from edc_base.model.models import BaseUuidModel


class OrderIdentifierHistory(BaseIdentifierModel, BaseUuidModel):

    def ignore_for_dispatch(self):
        return True

    class Meta:
        app_label = "mpepu_lab"
