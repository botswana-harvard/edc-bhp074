from edc.lab.lab_requisition.admin import BaseRequisitionModelAdmin

from apps.eit_maternal.models import MaternalVisit

from apps.eit_lab.models import Panel


class BaseMaternalRequisitionModelAdmin (BaseRequisitionModelAdmin):

    visit_model = MaternalVisit
    visit_fieldname = 'maternal_visit'
    dashboard_type = 'maternal'

    def __init__(self, *args, **kwargs):
        super(BaseMaternalRequisitionModelAdmin, self).__init__(*args, **kwargs)
        # remove these fields from admin fields list, default values should apply
        for fld in ['test_code']:
            self.fields.remove(fld)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        panel_pk = request.GET.get('panel', 0)
        if db_field.name == 'panel':
            kwargs["queryset"] = Panel.objects.filter(pk=panel_pk)
        if db_field.name == 'aliquot_type':
            if Panel.objects.filter(pk=panel_pk):
                if Panel.objects.get(pk=panel_pk).aliquot_type.all():
                    kwargs["queryset"] = Panel.objects.get(pk=panel_pk).aliquot_type.all()
        return super(BaseRequisitionModelAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
