from django.contrib import admin

from edc.lab.lab_packing.admin import BasePackingListAdmin, BasePackingListItemAdmin
from edc.lab.lab_profile.admin import BaseProfileAdmin, BaseProfileItemAdmin
from edc.lab.lab_profile.admin import BaseProcessingAdmin
from edc.base.modeladmin.admin import BaseModelAdmin
from edc.base.modeladmin.admin import BaseTabularInline
from edc.export.actions import export_as_csv_action

# from lis.labeling.actions import print_aliquot_label


from ..models import (InfantRequisition, MaternalRequisition, Aliquot, AliquotType, Receive, Panel,
                      AliquotProfileItem, AliquotProfile, AliquotProcessing)
from ..models import PackingList, PackingListItem
from ..forms import InfantRequisitionForm, MaternalRequisitionForm
from ..forms import PackingListForm, PackingListItemForm
from ..actions import create_order, print_aliquot_label

from .base_infant_requisition_model_admin import BaseInfantRequisitionModelAdmin
from .base_maternal_requisition_model_admin import BaseMaternalRequisitionModelAdmin


# MaternalRequisition
class MaternalRequisitionAdmin(BaseMaternalRequisitionModelAdmin):
    form = MaternalRequisitionForm
admin.site.register(MaternalRequisition, MaternalRequisitionAdmin)


# InfantRequisition
class InfantRequisitionAdmin(BaseInfantRequisitionModelAdmin):
    form = InfantRequisitionForm
admin.site.register(InfantRequisition, InfantRequisitionAdmin)


class PackingListAdmin(BasePackingListAdmin):
    fields = ('list_datetime','list_items', 'list_comment',)
    form = PackingListForm
    requisition = [InfantRequisition, MaternalRequisition, Aliquot ]
    packing_list_item_model = PackingListItem
admin.site.register(PackingList, PackingListAdmin)


class PackingListItemAdmin(BasePackingListItemAdmin):
    form = PackingListItemForm
    requisition = [InfantRequisition, MaternalRequisition, Aliquot]
admin.site.register(PackingListItem, BasePackingListItemAdmin)


class AliquotAdmin(BaseModelAdmin):
    date_hierarchy = 'created'

    actions = [print_aliquot_label, create_order,
               export_as_csv_action("Export as csv", fields=[], delimiter=',', exclude=['id', 'revision', 'hostname_created', 'hostname_modified', 'user_created', 'user_modified'],)]

    list_display = ("aliquot_identifier", 'subject_identifier', 'processing', 'related',
                    'to_receive', 'drawn', "aliquot_type", 'is_packed', 'panel','aliquot_condition', 'created',
                    'user_created', 'hostname_created')

    search_fields = ('aliquot_identifier', 'receive__receive_identifier', 'receive__registered_subject__subject_identifier')

    list_filter = ('aliquot_type', 'aliquot_condition', 'created', 'user_created', 'hostname_created')

    list_per_page = 15

admin.site.register(Aliquot, AliquotAdmin)


class AliquotTypeAdmin(BaseModelAdmin):

    list_display = ('name', 'alpha_code', 'numeric_code')

admin.site.register(AliquotType, AliquotTypeAdmin)

class AliquotProfileItemAdmin(BaseProfileItemAdmin):
    pass
admin.site.register(AliquotProfileItem, AliquotProfileItemAdmin)


class AliquotProfileItemInlineAdmin(BaseTabularInline):
    model = AliquotProfileItem

class AliquotProfileAdmin(BaseProfileAdmin):
    inlines = [AliquotProfileItemInlineAdmin]
admin.site.register(AliquotProfile, AliquotProfileAdmin)

class AliquotProcessingAdmin(BaseProcessingAdmin):

    list_display = ('aliquot', 'profile', 'created', 'modified', 'user_created', 'user_modified')

    search_fields = ('aliquot__aliquot_identifier', 'profile__name', 'aliquot__aliquot_type__name',
                     'aliquot__aliquot_type__alpha_code', 'aliquot__aliquot_type__numeric_code')

    list_filter = ('profile', 'created', 'modified', 'user_created', 'user_modified')

admin.site.register(AliquotProcessing, AliquotProcessingAdmin)

class ReceiveAdmin(BaseModelAdmin):

    date_hierarchy = 'receive_datetime'

    list_display = ("receive_identifier", "infant_requisition", "maternal_requisition", "receive_datetime", "drawn_datetime", 'registered_subject', 'subject_type', 'created', 'modified', 'import_datetime')

    search_fields = ('registered_subject__subject_identifier', 'subject_type', "receive_identifier", "requisition_identifier",)

    list_filter = ('created', "receive_datetime", "drawn_datetime", 'modified', 'import_datetime', )

    list_per_page = 15

    def get_readonly_fields(self, request, obj):
        return ['receive_identifier', 'requisition_model_name', 'clinician_initials'] + [field.name for field in obj._meta.fields if field.editable]

admin.site.register(Receive, ReceiveAdmin)


class PanelAdmin(BaseModelAdmin):

    list_display = ('name', 'panel_type')

    filter_horizontal = ("test_code", "aliquot_type", )

    list_filter = ('panel_type', )

admin.site.register(Panel, PanelAdmin)
