from edc.lab.lab_requisition.admin import BaseRequisitionModelAdmin
from apps.eit_infant.models import InfantVisit


class BaseInfantRequisitionModelAdmin (BaseRequisitionModelAdmin):

    visit_model = InfantVisit
    visit_fieldname = 'infant_visit'
    dashboard_type = 'infant'

    def __init__(self, *args, **kwargs):
        super(BaseInfantRequisitionModelAdmin, self).__init__(*args, **kwargs)
        # remove these fields from admin fields list, default values should apply
        for fld in ['test_code']:
            self.fields.remove(fld)
