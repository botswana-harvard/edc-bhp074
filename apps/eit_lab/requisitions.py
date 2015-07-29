from edc.lab.lab_requisition.classes import site_requisitions
from .models import InfantRequisition, MaternalRequisition


site_requisitions.register('infant', InfantRequisition)
site_requisitions.register('maternal', MaternalRequisition)
