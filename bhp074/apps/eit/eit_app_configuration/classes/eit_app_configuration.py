from datetime import datetime

try:
    from config.labels import aliquot_label
except ImportError:
    aliquot_label = None

from edc.apps.app_configuration.classes import BaseAppConfiguration
from edc.core.bhp_variables.models import StudySpecific, StudySite
from edc.lab.lab_packing.models import DestinationTuple
from edc.lab.lab_profile.classes import ProfileItemTuple, ProfileTuple

from lis.labeling.classes import LabelPrinterTuple, ZplTemplateTuple, ClientTuple
from lis.specimen.lab_aliquot_list.classes import AliquotTypeTuple
from lis.specimen.lab_panel.classes import PanelTuple

study_start_datetime = datetime(2011, 05, 10, 8, 00, 00)
study_end_datetime = datetime(2016, 01, 20, 23, 49, 40)


class EitAppConfiguration(BaseAppConfiguration):

    def prepare(self):
        super(EitAppConfiguration, self).prepare()

    global_configuration = {'dashboard': {'show_not_required_metadata': False, 'allow_additional_requisitions': False, 'show_drop_down_requisitions': True},
                            'appointment': {'allowed_iso_weekdays': '12345', 'use_same_weekday': True, 'default_appt_type': 'default'},
                                 }

    study_variables_setup = {
                'protocol_number': 'BHP074',
                'protocol_code': '074',
                'protocol_title': 'BHP074',
                'research_title': 'BHP074',
                'study_start_datetime': study_start_datetime,
                'minimum_age_of_consent': 16,
                'maximum_age_of_consent': 64,
                'gender_of_consent': 'F',
                'subject_identifier_seed': '10000',
                'subject_identifier_prefix': '074',
                'subject_identifier_modulus': '7',
                'subject_type': 'subject',
                'machine_type': 'SERVER',
                'hostname_prefix': 's007',
                'device_id': '0'}

    v1_consent_catalogue_setup = {
                'name': 'eit',
                'content_type_map': 'maternalconsent',
                'consent_type': 'study',
                'version': 1,
                'start_datetime': study_start_datetime,
                'end_datetime': study_end_datetime,
                'add_for_app': 'eit_maternal'}

    study_site_setup = [{'site_name': 'Gaborone', 'site_code': '4'},
                        {'site_name': 'Francistown', 'site_code': '6'},
                        ]

    lab_clinic_api_setup = {
        'panel': [
                  PanelTuple('Viral Load', 'TEST', 'WB'),
                  PanelTuple('Hematology (ARV)', 'TEST', 'WB'),
                  PanelTuple('PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB'),
                  PanelTuple('CD4 (ARV)', 'TEST', 'WB'),
                  PanelTuple('Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB'),
                  PanelTuple('BHP074 Chemistry', 'TEST', 'WB'),
                  PanelTuple('BHP074 Chemistry LPZ', 'TEST', 'WB'),
                  PanelTuple('DNA PCR', 'TEST', 'WB'),
                  PanelTuple('ELISA', 'TEST', 'WB'),
                  PanelTuple('Pharmacokinetics', 'TEST', 'WB'),
                  PanelTuple('Plasma and Buffy Coat Storage', 'STORAGE', 'WB'),
                  ],
        'aliquot_type': [AliquotTypeTuple('Whole Blood', 'WB', '02'),
                        AliquotTypeTuple('Serum', 'SERUM', '06'),
                        AliquotTypeTuple('Dried Blood Spot', 'DBS', '01'),
                        AliquotTypeTuple('Plasma', 'PL', '32'),
                        AliquotTypeTuple('Buffy Coat', 'BC', '16'),
                         ]}

    lab_setup = {'eit': {
                    'destination': [DestinationTuple('BHHRL', 'Botswana-Harvard HIV Reference Laboratory',
                                                  'Gaborone', '3902671', 'bhhrl@bhp.org.bw'),],
                    'panel': [
                              PanelTuple('Viral Load', 'TEST', 'WB'),
                              PanelTuple('Hematology (ARV)', 'TEST', 'WB'),
                              PanelTuple('PBMC Plasma (STORE ONLY)', 'STORAGE', 'WB'),
                              PanelTuple('CD4 (ARV)', 'TEST', 'WB'),
                              PanelTuple('Chemistry NVP/LFT + ALPL6 (ARV)', 'TEST', 'WB'),
                              PanelTuple('BHP074 Chemistry', 'TEST', 'WB'),
                              PanelTuple('BHP074 Chemistry LPZ', 'TEST', 'WB'),
                              PanelTuple('DNA PCR', 'TEST', 'WB'),
                              PanelTuple('ELISA', 'TEST', 'WB'),
                              PanelTuple('Pharmacokinetics', 'TEST', 'WB'),
                              PanelTuple('Plasma and Buffy Coat Storage', 'STORAGE', 'WB'),
                              ],
                    'aliquot_type': [AliquotTypeTuple('Whole Blood', 'WB', '02'),
                                     AliquotTypeTuple('Serum', 'SERUM', '06'),
                                     AliquotTypeTuple('Dried Blood Spot', 'DBS', '01'),
                                     AliquotTypeTuple('Plasma', 'PL', '32'),
                                     AliquotTypeTuple('Buffy Coat', 'BC', '16'),

                                     ],
                    'profile': [ProfileTuple('PBMC Plasma (STORE ONLY)','WB'),
                                ],
                    'profile_item': [ProfileItemTuple('PBMC Plasma (STORE ONLY)', 'PL', 1.8, 3),
                                     ProfileItemTuple('PBMC Plasma (STORE ONLY)', 'BC', 0.5, 1),
                                     ]
                    }}

    labeling_setup = {'label_printer': [
                                        LabelPrinterTuple('ZebraT', 'fchilisa', '127.0.0.1', True),
                                        ],
                      'client': [ClientTuple(hostname='fchilisa', aliases=None, ip=None, printer_name='ZebraT', cups_hostname='fchilisa',),
                                  ],
                      'zpl_template': [aliquot_label or ZplTemplateTuple(
                                'aliquot_label', (
                                    """^XA
                                    ^FO325,5^A0N,15,20^FD%(protocol)s Site %(site)s %(item_count)s/%(item_count_total)s^FS
                                    ^FO320,20^BY1,3.0^BCN,50,N,N,N
                                    ^BY^FD%(specimen_identifier)s^FS
                                    ^FO320,80^A0N,15,20^FD%(specimen_identifier)s [%(requisition_identifier)s]^FS
                                    ^FO325,100^A0N,15,20^FD%(panel)s %(aliquot_type)s^FS
                                    ^FO325,118^A0N,16,20^FD%(subject_identifier)s (%(initials)s)^FS
                                    ^FO325,136^A0N,16,20^FDDOB: %(dob)s %(gender)s^FS
                                    ^FO325,152^A0N,20^FD%(drawn_datetime)s^FS
                                    ^XZ"""
                                    ),
                                True),
                        ZplTemplateTuple(
                                'requisition_label', (
                                    """^XA
                                    ^FO325,5^A0N,15,20^FD${protocol} Site ${site} ${label_count}/${label_count_total}^FS
                                    ^FO320,20^BY1,3.0^BCN,50,N,N,N
                                    ^BY^FD${specimen_identifier}^FS
                                    ^FO320,80^A0N,15,20^FD${specimen_identifier} [${requisition_identifier}]^FS
                                    ^FO325,100^A0N,15,20^FD${panel} ${aliquot_type}^FS
                                    ^FO325,118^A0N,16,20^FD${subject_identifier} (${initials})^FS
                                    ^FO325,136^A0N,16,20^FDDOB: ${dob} ${gender}^FS
                                    ^FO325,152^A0N,20^FD${drawn_datetime}^FS
                                    ^XZ"""
                                    ),
                                True),
                        ZplTemplateTuple(
                                'dispensing', (
                                    """^XA
                                    ^FO100,25^A0N,25^FDBotswana-Harvard Partnership - SID ${sid}^FS
                                    ^FO100,50^BY2.0^BCN,50,N,N,N
                                    ^BY^FD${barcode_value}^FS
                                    ^FO100,120^A0N,20^FD${barcode_value}^FS
                                    ^FO100,150^A0N,30^FD${subject_identifier} [${initials}]^FS
                                    ^FO100,180^A0N,40^FD${treatment}^FS
                                    ^FO100,220^A0N,35^FDDosage: ${dose}^FS
                                    ^FO100,270^A0N,40^FD${packing_amount} ${packing_unit}^FS
                                    ^FO100,330^A0N,30^FDdispensed on ${dispense_date} by ${user_created}^FS
                                    ^XZ"""
                                    ),
                                True),
                                     ],
                      }

    consent_catalogue_list = [v1_consent_catalogue_setup,]

    def update_or_create_study_variables(self):
        if StudySpecific.objects.all().count() == 0:
            StudySpecific.objects.create(**self.study_variables_setup)
        else:
            StudySpecific.objects.all().update(**self.study_variables_setup)
        self._setup_study_sites()

    def _setup_study_sites(self):
        for site in self.study_site_setup:
            try:
                StudySite.objects.get(**site)
            except StudySite.DoesNotExist:
                StudySite.objects.create(**site)
