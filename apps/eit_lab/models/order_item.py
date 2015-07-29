from datetime import datetime

from django.db import models

from edc.audit.audit_trail import AuditTrail
from edc.device.sync.models import BaseSyncUuidModel

from apps.eit_lab.models import Aliquot
from apps.eit_lab.models import Order
from apps.eit_lab.models import Panel
# from ..managers import OrderItemManager


class OrderItem(BaseSyncUuidModel):

    order = models.ForeignKey(Order)

    aliquot = models.ForeignKey(Aliquot)

    panel = models.ForeignKey(Panel,
        null=True,
        blank=False,
        )

    order_identifier = models.CharField(
        max_length=25,
        null=True,
        help_text='',
        )

    order_datetime = models.DateTimeField(
        default=datetime.today()
        )

    subject_identifier = models.CharField(
        max_length=50,
        null=True,
        help_text="non-user helper field to simplify search and filtering")

    history = AuditTrail()

#     objects = OrderItemManager()

    def save(self, *args, **kwargs):
        self.subject_identifier = self.aliquot.receive.registered_subject.subject_identifier
        super(OrderItem, self).save(*args, **kwargs)

    def natural_key(self):
        return (self.order_identifier, )

    class Meta:
        app_label = 'eit_lab'
        ordering = ['-order_datetime', ]
