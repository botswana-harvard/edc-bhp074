from django.db import models

from edc.lab.lab_profile.models import BaseProfile

# from ..managers import ProfileManager

from apps.eit_lab.models import AliquotType


class AliquotProfile(BaseProfile):

    aliquot_type = models.ForeignKey(AliquotType,
        verbose_name='Source aliquot type')

#     objects = ProfileManager()

    def natural_key(self):
        return (self.name,)

    class Meta:
        app_label = 'eit_lab'
        db_table = 'eit_lab_profile'
