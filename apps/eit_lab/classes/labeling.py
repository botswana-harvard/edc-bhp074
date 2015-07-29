from edc.subject.registration.models import RegisteredSubject

from lis.labeling.classes import AliquotLabel

from ..models import InfantRequisition, MaternalRequisition


class EitAliquotLabeling(AliquotLabel):

    def refresh_label_context(self):
        super(EitAliquotLabeling, self).refresh_label_context()
        aliquot = self.model_instance
        subject_identifier = aliquot.get_subject_identifier()
        registered_subject = RegisteredSubject.objects.get(subject_identifier=subject_identifier)
        if registered_subject.subject_type.lower() == 'infant':
            requisition = InfantRequisition.objects.get(
                    requisition_identifier=aliquot.receive.requisition_identifier
                    )
        else:
            requisition = MaternalRequisition.objects.get(
                requisition_identifier=aliquot.receive.requisition_identifier
                    )
        panel = requisition.panel
        custom = {}
        custom.update({
           'panel':  panel })
        self.label_context.update(**custom)
