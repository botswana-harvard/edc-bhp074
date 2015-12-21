from datetime import datetime

from django.db import models

from edc_base.model.models import BaseUuidModel
from edc_base.audit_trail import AuditTrail


class Order(BaseUuidModel):

    order_datetime = models.DateTimeField(default=datetime.today())

    objects = models.Manager()

    history = AuditTrail()

    def natural_key(self):
        return (self.order_datetime, )

    class Meta:
        app_label = 'eit_lab'
