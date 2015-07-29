from edc.subject.consent.models import BaseConsent
from edc.subject.consent.mixins.bw import IdentityFieldsMixin
from edc.subject.consent.mixins import ReviewAndUnderstandingFieldsMixin

# from .maternal_off_study_mixin import MaternalOffStudyMixin


class BaseMaternalConsent(BaseConsent):

    """Model for maternal consent and registration model for mothers."""

    def get_subject_type(self):
        return 'maternal'

    def get_subject_identifier(self):
        return self.subject_identifier

    @property
    def is_hiv_positive(self):
        return 'Yes'

    def get_result_value(self, attr=None):
        """Returns a result value for given attr name for the lab_tracker."""
        retval = None
        if not attr in dir(self):
            raise TypeError('Attribute {0} does not exist in model {1}'.format(attr, self._meta.object_name))
        if attr == 'is_hiv_positive':
            if self.is_hiv_positive.lower() == 'yes':
                retval = 'POS'
            else:
                retval = 'NEG'
        return retval

    class Meta:
        abstract = True

# add Mixin fields to abstract class
for field in IdentityFieldsMixin._meta.fields:
    if field.name not in [fld.name for fld in BaseMaternalConsent._meta.fields]:
        field.contribute_to_class(BaseMaternalConsent, field.name)

# for field in ReviewAndUnderstandingFieldsMixin._meta.fields:
#     if field.name not in [fld.name for fld in BaseMaternalConsent._meta.fields]:
#         field.contribute_to_class(BaseMaternalConsent, field.name)
