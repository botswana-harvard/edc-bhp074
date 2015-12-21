from lis.labeling.classes import ZplTemplateTuple
from lis.labeling.classes import AliquotLabel

"""Added here to override the default in app_configuration."""

aliquot_label = ZplTemplateTuple(
    'aliquot_label', (
        ('^XA\n'
         '^FO325,18^A0N,20,20^FD${protocol} Site ${site} ${clinician_initials} ${aliquot_type} ${aliquot_count}${primary}^FS\n'
         '^FO315,38^BY1,3.0^BCN,50,N,N,N,N\n'
         '^BY^FD${aliquot_identifier}^FS\n'
         '^FO315,92^A0N,20,20^FD${aliquot_identifier}^FS\n'
         '^FO315,114^A0N,20,20^FD${panel}^FS\n'
         '^FO315,132^A0N,20,20^FD${subject_identifier} (${initials})^FS\n'
         '^FO315,149^A0N,20,20^FDDOB: ${dob} ${gender}^FS\n'
         '^FO315,164^A0N,20,20^FD${drawn_datetime}^FS\n'
         '^XZ')
    ), True)