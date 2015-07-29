from django.db import models

from edc.lab.lab_profile.models import BaseProcessing
from edc.lab.lab_profile.classes import site_lab_profiles

from .aliquot import Aliquot
from .aliquot_profile import AliquotProfile
# from ..managers import AliquotProcessingManager


class AliquotProcessing(BaseProcessing):

    aliquot = models.ForeignKey(Aliquot,
        verbose_name='Source Aliquot',
        help_text='Create aliquots from this one.')

    profile = models.ForeignKey(AliquotProfile,
        verbose_name='Profile',
        help_text='Create aliquots according to this profile.')
# 
#     def save(self, *args, **kwargs):
#         lab_profile = site_lab_profiles.registry.get(self.aliquot.receive.requisition_model_name)
#         lab_profile().aliquot_by_profile(self.aliquot, self.profile)
#         super(BaseProcessing, self).save(*args, **kwargs)

#     objects = AliquotProcessingManager()

#     def natural_key(self):
#         return self.aliquot.natural_key() + self.profile.natural_key()
#  
#     def deserialize_get_missing_fk(self, attrname):
#         retval = None
#         return retval

    class Meta:
        app_label = 'eit_lab'
        db_table = 'eit_lab_processing'
