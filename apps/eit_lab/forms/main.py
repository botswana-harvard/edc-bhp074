from django import forms

from edc.lab.lab_packing.forms import BasePackingListForm, BasePackingListItemForm
from edc.lab.lab_requisition.forms import BaseRequisitionForm

from ..models import InfantRequisition, MaternalRequisition
from ..models import PackingList, PackingListItem


class InfantRequisitionForm (BaseRequisitionForm):

    def clean(self):
        cleaned_data = self.cleaned_data
        if not cleaned_data.get('is_drawn'):
            raise forms.ValidationError("This field is required. Please fill it in.")
        return super(InfantRequisitionForm, self).clean()

    class Meta:
        model = InfantRequisition


class MaternalRequisitionForm (BaseRequisitionForm):

    def clean(self):
        return super(MaternalRequisitionForm, self).clean()

    class Meta:
        model = MaternalRequisition


class PackingListForm (BasePackingListForm):

    def clean(self):
        self.requisition = [InfantRequisition, MaternalRequisition, ]
        return  super(PackingListForm, self).clean()

    class Meta:
        model = PackingList


class PackingListItemForm (BasePackingListItemForm):

    def clean(self):
        self.requisition = [InfantRequisition, MaternalRequisition, ]
        return  super(BasePackingListItemForm, self).clean()

    class Meta:
        model = PackingListItem
