
SITE_IDENTIFIERS = (
    (4, 'Gaborone'),
    (1, 'Molepolole'),    
    (3, 'Lobatse'),    
)

AUTOPSY_SOURCE = (
    ('Mother of infant', 'Mother of infant'),
    ('OTHER family member', 'Other family member'),
    ('Health Professional', 'Health Professional who cared for the infant'),
    ('Medical records', 'Medical records'),
    ('OTHER', 'Other, specify'),
)    

ALIVE_DECEASED = (
    ('ALIVE', 'Alive'),
    ('DECEASED', 'Deceased'),
    )    
    
ARV_AZT_NVP = (
    ('NVP', 'NVP'),
    ('AZT', 'AZT'),
    ('OTHER', 'Other (specify)'),
)    


ARV_INTERRUPTION_REASON = (
    ('TOXICITY', 'Toxicity'),
    ('NO_DRUGS', 'No drugs available'),
    ('NO_REFILL', 'Didn\'t get to clinic for refill'),
    ('FORGOT', 'Mother forgot to take the ARVs'),
    ('OTHER', 'Other'),
    ('N/A', 'Not Applicable'),
    )
    
ARV_LIST = (

    ('AZT', 'AZT'),
    ('3TC', '3TC'),
    ('Combivir', 'Combivir (AZT, 3TC)'),
    ('Tenofovir', 'Tenofovir'),
    ('Truvada', 'Truvada (Tenofovir, FTC)'),
    ('Abacavir', 'Abacavir'),
    ('Trizivir', 'Trizivir (AZT, 3TC, Abacavir)'),
    ('D4T', 'D4T'),
    ('DDI', 'DDI'),
    ('Nevirapine', 'Nevirapine'),
    ('Efavirenz', 'Efavirenz (or Sustiva)'),
    ('Kaletra', 'Kaletra (or Aluvia)'),
    ('Raltegravir', 'Raltegravir'),
    ('UNKNOWN', 'HAART, unknown?'),
    ('OTHER', 'Other (specify)'),
)



 

CARDIOVASCULAR_DISORDER = (
    ('None', 'None'),
    ('Truncus arteriosus', 'Truncus arteriosus'),	
    ('Atrial septal defect', 'Atrial septal defect'), 	
    ('Ventricula septal defect', 'Ventricula septal defect'), 	
    ('Atrioventricular canal', 'Atrioventricular canal'), 	
    ('Complete transposition of the great vessels (without VSD)', 'Complete transposition of the great vessels (without VSD)'), 	
    ('Complete transposition of the great vessels (with VSD)', 'Complete transposition of the great vessels (with VSD)'), 	
    ('Tetralogy of Fallot', 'Tetralogy of Fallot'), 	
    ('Pulmonary valve stenosis or atresia', 'Pulmonary valve stenosis or atresia'), 	
    ('Tricuspid valve stenosis or atresia', 'Tricuspid valve stenosis or atresia'), 	
    ('Mitral valve stenosis or atresia', 'Mitral valve stenosis or atresia'), 
    ('Hypoplastic left ventricle', 'Hypoplastic left ventricle'), 	
    ('Hypoplastic right ventricle', 'Hypoplastic right ventricle'), 	
    ('Congenital cardiomyopath (do not code if only isolated cardiomegaly)', 'Congenital cardiomyopath (do not code if only isolated cardiomegaly)'), 	
    ('Coarclation of the aorta', 'Coarclation of the aorta'), 	
    ('Total anomalous pulmonary venous return', 'Total anomalous pulmonary venous return'), 	
    ('Arteriovenous malformation, specify site', 'Arteriovenous malformation, specify site'), 	
    ('Patent ductous arteriosus (persisting >6 weeks of age)', 'Patent ductous arteriosus (persisting >6 weeks of age)'), 	
    ('OTHER', 'Other cardiovascular malformation, specify'), 	
)  
       
CLEFT_DISORDER = (
    ('None', 'None'),
    ('Cleft lip without cleft palate', 'Cleft lip without cleft palate'), 	
    ('Cleft palate without cleft lip', 'Cleft palate without cleft lip'), 	
    ('Cleft lip and palate', 'Cleft lip and palate'), 	
    ('Cleft uvula', 'Cleft uvula'), 
)

CNS_ABNORMALITIES = (
    ('None', 'None'),
    ('Anencephaly', 'Anencephaly'), 	
    ('Encephaloceis', 'Encephaloceis'),	
    ('Spina bifida, open', 'Spina bifida, open'),	
    ('Spina bifida, closed', 'Spina bifida, closed'),	
    ('Holoprosencephaly', 'Holoprosencephaly'),  	
    ('Isolated hydroencephaly (not associated with spina bifida)',	'Isolated hydroencephaly (not associated with spina bifida)'),
    ('Other CNS defect, specify',  'Other CNS defect, specify'),
)

COOKING_METHOD = (
    ('Gas or electric stove', 'Gas or electric stove'),
    ('Paraffin stove', 'Paraffin stove'),
    ('Wood-burning stove or open fire', 'Wood-burning stove or open fire'),
    ('No regular means of heating', 'No regular means of heating'),
)    

CURRENT_OCCUPATION = (
    ('Housewife', 'Housewife'),
    ('Salaried (government)', 'Salaried (government)'),
    ('Salaried (private, not including domestic work)', 'Salaried (private, not including domestic work)'),
    ('Domestic work (paid)', 'Domestic work (paid)'),
    ('Self-employed', 'Self-employed'),
    ('Student', 'Student'),
    ('Unemployed', 'Unemployed'),
    ('OTHER', 'Other, specify'),
)    

DELIVERY_HOSPITAL = (
    ('PHH', 'Gaborone(PMH)'),
    ('SLH', 'Molepolole(SLH)'),
    ('ATHLONE', 'Lobatse(Athlone)'),
    ('G.West Clinic', 'G.West Clinic'),
    ('Old Naledi Clinic','Old Naledi Clinic'),
    ('BH3 Clinic', 'BH3 Clinic'),
    ('Mafitlhakgosi Clinic','Mafitlhakgosi Clinic'),
    ('Tsopeng Clinic', 'Tsopeng Clinic'),
    ('Peleng East Clinic', 'Peleng East Clinic'), 
    ('OTHER health facility', 'Other health facilities not associated with study site'),
    ('HOME', 'Home'),
    ('LANDS', 'Lands'),
    ('OTHER location', 'Other location'), 
    )
    
DX_DRUG_RELATIONSHIP = (
    ('Anemia', 'Anemia'),
    ('Rash', 'Rash'),
    ('Hepatitis', 'Hepatitis'),
    ('Neutropenia', 'Neutropenia'),
    ('Other diagnosis CTX/NVP related)', 'Other diagnosis possibly related to CTX/plc or NVP, specify)'),
)



DRUG_RELATIONSHIP = (
    ('Not related', 'Not related'),
    ('Probably not related', 'Probably not related'),
    ('Possibly related', 'Possibly related'),
    ('Probably related', 'Probably related'),
    ('Definitely related', 'Definitely related'),
)             
DRUG_ROUTE = (
    ('Oral', 'Oral'),
    ('Intravenous', 'Intravenous'),
    ('Both', 'Both (Oral & Intravenous)'),
) 

DX = (
    ('Pneumonia suspected, no CXR or microbiologic confirmation', 'Pneumonia suspected, no CXR or microbiologic confirmation'),
    ('Pneumonia, CXR confirmed, no bacterial pathogen', 'Pneumonia, CXR confirmed, no bacterial pathogen'),
    ('Pneumonia, CXR confirmed, bacterial pathogen isolated (specify pathogen)', 'Pneumonia, CXR confirmed, bacterial pathogen isolated (specify pathogen)'),
    ('Pulmonary TB, suspected(no CXR or microbiologic confirmation)', 'Pulmonary TB, suspected(no CXR or microbiologic confirmation)'),
    ('Pulmonary TB, CXR-confirmed (no microbiologic confirmation)', 'Pulmonary TB, CXR-confirmed (no microbiologic confirmation)'),
    ('Pulmonary TB, smear and/or culture positive', 'Pulmonary TB, smear and/or culture positive'),
    ('Extrapulmonary TB,suspected (no CXR or microbiologic confirmation) ', 'Extrapulmonary TB,suspected (no CXR or microbiologic confirmation) '),
    ('Extrapulmonary TB, smear and/or culture positive', 'Extrapulmonary TB, smear and/or culture positive'),
    ('Acute diarrheal illness (bloody diarrhean OR increase of at least 7 stools per day OR life threatening for less than 14 days) ', 'Acute diarrheal illness (bloody diarrhean OR increase of at least 7 stools per day OR life threatening for less than 14 days)'),
    ('Chronic diarrheal illness (as above but for 14 days or longer) ', 'Chronic diarrheal illness (as above but for 14 days or longer) '),
    ('Acute Hepatitis in this pregnancy: Drug related ', 'Acute Hepatitis in this pregnancy: Drug related '),
    ('Acute Hepatitis in this pregnancy:Traditional medication related', 'Acute Hepatitis in this pregnancy:Traditional medication related'),
    ('Acute Hepatitis in this pregnancy:Fatty liver disease', 'Acute Hepatitis in this pregnancy:Fatty liver disease'),
    ('Acute Hepatitis in this pregnancy:Hepatitis A', 'Acute Hepatitis in this pregnancy:Hepatitis A'),
    ('Acute Hepatitis in this pregnancy:Hepatitis B ', 'Acute Hepatitis in this pregnancy:Hepatitis B'),
    ('Acute Hepatitis in this pregnancy:Alcoholic', 'Acute Hepatitis in this pregnancy:Alcoholic'),
    ('Acute Hepatitis in this pregnancy:Other/Unkown', 'Acute Hepatitis in this pregnancy:Other/Unkown'),
    ('Sepsis, unspecified', 'Sepsis, unspecified'),
    ('Sepsis, pathogen specified', 'Sepsis, pathogen specified'),
    ('Meningitis, unspecified', 'Meningitis, unspecified'),
    ('Meningitis, pathogen specified', 'Meningitis, pathogen specified'),
    ('Appendicitis', 'Appendicitis'),
    ('Cholecystitis/cholanangitis', 'Cholecystitis/cholanangitis'),
    ('Pancreatitis', 'Pancreatitis'),
    ('Acute Renal failure', 'Acute Renal failure (Record highest creatinine level if tested outside of the study)'),
    ('Anemia', 'Anemia (Only report grade 3 or 4 anemia based on the lab value drawn outside the study)'),
    ('Pregnancy/peripartum cardiomyopathy or CHF ', 'Pregnancy/peripartum cardiomyopathy or CHF '),
    ('Drug rash on HAART', 'Drug rash on HAART'),
    ('Trauma/Accident', 'Trauma/Accident'),
    ('Other serious (grade 3 or 4) infection, specify', 'Other serious (grade 3 or 4) infection(not listed above), specify'),
    ('Other serious (grade 3 or 4) non-infectious diagnosis, specify', 'Other serious (grade 3 or 4) non-infectious diagnosis(not listed above), specify'),
)
   

ETHNICITY = (
    ('Black African', 'Black African'),
    ('Caucasian', 'Caucasian'),
    ('Asian', 'Asian'),
    ('OTHER', 'Other, specify'),
)    
   
FACIAL_DEFECT = (
    ('None', 'None'),
    ('Anophthalmia/micro-opthalmia', 'Anophthalmia/micro-opthalmia'),	
    ('Cataracts', 'Cataracts'), 	
    ('Coloboma', 'Coloboma'), 	
    ('OTHER eye abnormality', 'Other eye abnormality, specify'), 	
    ('Absence of ear', 'Absence of ear'), 	
    ('Absence of auditory canal', 'Absence of auditory canal'), 	
    ('Congenital deafness', 'Congenital deafness'), 	
    ('Microtia', 'Microtia'), 	
    ('OTHER ear anomaly', 'Other ear anomaly, specify'), 	
    ('Brachial cleft cyst, sinus or pit', 'Brachial cleft cyst, sinus or pit'), 	
    ('OTHER facial malformation', 'Other facial malformation, specify'), 	
)



    
FEM_GENITAL_ANOMALY = (
    ('None', 'None'),
    ('Ambinguous genitalia, female', 'Ambinguous genitalia, female'),	
    ('Vaginal agenesis', 'Vaginal agenesis'), 	
    ('Absent or streak ovary', 'Absent or streak ovary'), 	
    ('Uterine anomaly', 'Uterine anomaly'), 	
    ('OTHER', 'Other ovarian, fallopian, uterine, cervical, vaginal, or vulvar abnormality'), 	
)

HIGHEST_EDUCATION = (
    ('None', 'None'),
    ('Primary', 'Primary'),
    ('Junior Secondary', 'Junior Secondary'),
    ('Senior Secondary', 'Senior Secondary'),
    ('Tertiary', 'Tertiary'),
)

HOUSE_TYPE = (
    ('Formal:Tin-roofed, concrete walls', 'Formal: Tin-roofed, concrete walls'),
    ('Informal: Mud-walled or thatched', 'Informal: Mud-walled or thatched'),
    ('Mixed formal/informal', 'Mixed formal/informal'),
    ('Shack/Mokhukhu', 'Shack/Mokhukhu'),
) 

INFANT_DRUG_INITIATION=(
    ('caregiver change mind','1. Infant\'s caregiver changed mind after randomisation'),
    ('congenital anomaly','2. Contra-indicated: Infant with congenital anomaly affecting probability of survival to 18 months'),
    ('hiv infection','3. Contra-indicated: Infant with HIV infection'),
    ('medical condition','4. Contra-indicated: Infant with medical condition making survival to 18 months unlikely'),
    ('family refused','5. Participant\'s family refused to start'),
    ('OTHER','9. Other'),
    ('N/A', 'Not Applicable'),
)

INFANT_PRE_RANDO_LOSS_REASON = (
    ('mother under age','1. Mother of infant found to be less than 18years of age (after consenting) '),
    ('mother non-citizen','2. Mother found to not be a citizen of Botswana'),
    ('moving out of study area','3. Subject will be moving out of study area or unable to stay in study area'),
    ('lost,unable to contact','4. Lost to follow up,unable to contact'),
    ('lost, contacted','5. Lost to follow up,contacted but did not come to study clinic'),
    ('withdrawal','6. Participant changed mind and withdrew'),
    ('father decision','7. Father of baby did not want mother/infant to participate and participant withdrew consent'),
    ('other family member','8. Other family member did not want mother/infant to participate and participant withdrew consent'),
    ('mother died','9. Mother died after consenting,before infant randomized'),
    ('infant died','10. Infant died before being randomized'),
    ('still birth','11. Stillbirth occurred after mother consented in pregnancy'),
    ('infant HIV positive','12. Infant found to be HIV-infected'),
    ('18m survival unlikely','13. Infant diagnosed with medical conditions making survival to 18 months unlikel'),
    ('>34_day_old', '14. Infant over 34 days old'),
    ('OTHER','99. Other, specify'),
)

INFANT_OFF_STUDY_REASON = (
    ('completed protocol','1. Completion of protocol required period of time for observation'),
    ('death','2. Death (complete the DEATH REPORT FORM AF005) (For EAE Reporting requirements see EAE Reporting Manual)'),
    ('refused contact','3. Mother of participant (or Participant\'s family) refused further contact (explain in Comments below)'),
    ('moved','4. Mother of participant moved out of study area'),
    ('lost','5. Participant lost to follow-up (see study Protocol for definition of Lost to Follow-Up)'),
    ('OTHER','9. Other'),
)

INFO_PROVIDER = (
    ('MOTHER', 'Mother'),
    ('GRANDMOTHER', 'Grandmother'),
    ('FATHER', 'Father'),
    ('GRANDFATHER', 'Grandfather'),    
    ('SIBLING', 'Sibling'),
    ('OTHER', 'Other'),
)

KNOW_HIV_STATUS = (
    ('Nobody', 'Nobody'),
    ('1 person', '1 person'),
    ('2-5 people', '2-5 people'),
    ('6-10 people', '6-10 people'),
    ('More than 10 people', 'More than 10 people'),
    ('dont know', 'I do not know'),
)           

LABOUR_HOURS = (
    ('0<6', '0-<6 hours'), 
    ('6-12', '6-<12hours'), 
    ('12-24', '12-24hours'), 
    ('>24', '>24hours '), 
    ('UNKNOWN', 'Unknown'),
    )    

LABOUR_MODE_OF_DELIVERY = (
    ('vaginal', '   Vaginal delivery'), 
    ('elective_cesarean', 'Elective cesarean section'), 
    ('emergent_cesarean', 'Emergent cesarean section'),  
    )


    
LOWER_GASTROINTESTINAL_ABNORMALITY = (
    ('None', 'None'),
    ('Duodenal atresia, stenosis, or absence', 'Duodenal atresia, stenosis, or absence'),
    ('Jejunal atresis, stenosis, or absence', 'Jejunal atresis, stenosis, or absence'),	
    ('Ileal atresia, stenosis, or absence', 'Ileal atresia, stenosis, or absence'), 	
    ('Atresia, stenosis, or absence of large intestine, rectum, or anus', 'Atresia, stenosis, or absence of large intestine, rectum, or anus'), 	
    ('Hirschsprung disease', 'Hirschsprung disease'), 	
    ('OTHER megacolon', 'Other megacolon'), 	
    ('Liver, pancreas, or gall bladder defect, specify', 'Liver, pancreas, or gall bladder defect, specify'), 	
    ('Diaphramtic hernia', 'Diaphramtic hernia'), 	
    ('OTHER GI anomaly', 'Other GI anomaly, specify'), 
)

MALE_GENITAL_ANOMALY = (
    ('None', 'None'),
    ('Hypospadias, specify degree', 'Hypospadias, specify degree'), 	
    ('Chordee', 'Chordee'), 	
    ('Ambiguous genitalia, male', 'Ambiguous genitalia, male'), 	
    ('Undescended testis', 'Undescended testis'), 	
    ('OTHER', 'Other male genital abnormality, specify'), 
)

MARITAL_STATUS = (
    ('Single', 'Single'),
    ('Married', 'Married'),
    ('Cohabiting', 'Cohabiting'),
    ('Widowed', 'Widowed'),
    ('Divorced', 'Divorced'),
    ('OTHER', 'Other, specify'),
) 

MONEY_EARNED = (
    ('None', 'None'),
    ('<P200 per month / <P47 per week', '<P200 per month / <P47 per week'),
    ('P200-500 per month / P47-116 per week', 'P200-500 per month / P47-116 per week'),
    ('P501-1000 per month / P117 - 231 per week', 'P501-1000 per month / P117 - 231 per week'),
    ('P1001-5000 per month / P212 - 1157 per week', 'P1001-5000 per month / P212 - 1157 per week'),
    ('P5000 per month / >P1157 per week', 'P5000 per month / >P1157 per week'), 
    ('Unsure', 'Unsure'), 
)     

MONEY_PROVIDER = (
    ('You', 'You'),
    ('Partner/husband', 'Partner/husband'),
    ('Mother', 'Mother'),
    ('Father', 'Father'),
    ('Sister', 'Sister'),
    ('Brother', 'Brother'),
    ('Aunt', 'Aunt'),
    ('Uncle', 'Uncle'),
    ('Grandmother', 'Grandmother'),
    ('Grandfather', 'Grandfather'),
    ('Mother-in-law or Father-in-law', 'Mother-in-law or Father-in-law'),
    ('Friend', 'Friend'),
    ('Work collegues', 'Work collegues'),
    ('Unsure', 'Unsure'), 
    ('OTHER', 'Other, specify'),
)    

MOUTH_UP_GASTROINT_DISORDER  = (
    ('None', 'None'),
    ('Aglossia', 'Aglossia'),	
    ('Macroglossia', 'Macroglossia'),	
    ('OTHER mouth, lip, or tongue', 'Other mouth, lip, or tongue anomaly, specify'),
    ('Esophageal atresia', 'Esophageal atresia'), 	
    ('Tracheoesphageal fistula', 'Tracheoesphageal fistula'), 	
    ('Esophageal web', 'Esophageal web'), 	
    ('Pyloric stenosis', 'Pyloric stenosis'), 	
    ('OTHER esophageal or stomach', 'Other esophageal or stomach abnormality, specify'), 	
)
    
 
MP010_MEDICATIONS =(
    ('None', 'None'),
    ('Acyclovir', 'Acyclovir'),	  	  	 
	('Albuterol', 'Albuterol'),	  	  	 
	('Albendazol', 'Albendazol'), 	  	  	 
	('Aminophylline', 'Aminophylline'), 	  	  	 
	('Amoxicillin', 'Amoxicillin'),	  	  	 
	('Ampicillin', 	'Ampicillin'),  	  	 
	('Antibiotic,unknown(specify 1V or oral)', 'Antibiotic,unknown(specify 1V or oral)'),	  	  	 
	('Azithromycin', 'Azithromycin'), 	  	  	 
	('Carbamazepine', 'Carbamazepine'),	  	  	 
	('Ceftriaxone',  'Ceftriaxone'),	  	  	 
	('Cotrimoxazole (trimethoprim/sulfamethoxazole)', 'Cotrimoxazole (trimethoprim/sulfamethoxazole)'),	  	  	 
	('Cefaclor,cefixime,ceftizoxime,ceftraxone', 'Cefaclor,cefixime,ceftizoxime,ceftraxone'),	  	  	 
	('Chloramphenicol',  'Chloramphenicol'),	  	  	 
	('Ciprofloxacin', 'Ciprofloxacin'),	   	  	 
	('Clarithromycin', 'Clarithromycin'),	  	  	 
	('Cloxacillin', 'Cloxacillin'),	  	  	 
	('Doxycycline', 'Doxycycline'), 	  	  	 
	('Dexamethasone', 'Dexamethasone'), 	  	  	   	  	 
	('Diazepam', 'Diazepam'),	  	  	 
	('Erythromycin', 'Erythromycin'),	  	  	 
	('Ethambutol', 'Ethambutol'), 	  	  	 
	('Ferrous sulfate', 'Ferrous sulfate'), 	  	  	 
	('Fuconazole', 'Fuconazole'),	  	  	 
	('Foscarnate', 'Foscarnate'), 	  	  	 
	('Ganciclovir', 'Ganciclovir'),	  	  	 
	('Gentamicin', 'Gentamicin'),	  	  	 
	('Hydrocortisone', 'Hydrocortisone'),	  	  	 
	('Insuline', 'Insuline'), 	  	  	 
	('Isoniazid', 'Isoniazid'), 	  	  	 
	('Ketoconazole', 'Ketoconazole'), 	  	  	 
	('Mebendazole', 'Mebendazole'), 	  	  	 
	('Metronidazole', 'Metronidazole'), 	  	  	 
	('Methylprednisolone', 'Methylprednisolone'), 	  	  	 
	('Nalidixic acid', 'Nalidixic acid'),	  	  	 
	('Norfloxacin,Ofloxacin', 'Norfloxacin,Ofloxacin'),	  	  	 
	('Pentamidine', 'Pentamidine'), 	  	  	 
	('Pyridoxine', 'Pyridoxine'), 	  	  	 
	('Phenytoin', 'Phenytoin'),   	  	 
	('Prednisolone', 'Prednisolone'),	  	  	 
	('Pyrazinamide', 'Pyrazinamide'),	  	  	 
	('Pyrimethamine', 'Pyrimethamine'), 	  	  	 
	('Quinidine', 'Quinidine'),	  	  	 
	('Red blood cell transfusion', 'Red blood cell transfusion'), 	  	  	 
	('Rifampicin', 'Rifampicin'),  	  	  	 
	('Salbutamol', 'Salbutamol'),	  	  	 
	('Streptomycin', 'Streptomycin'), 	  	  	 
	('Sulfadiazine', 'Sulfadiazine'), 	  	  	 
	('Terbinafine', 'Terbinafine'), 	  	  	 
	('Tetracycline', 'Tetracycline'),  	  	  	 
	('Theophylline', 'Theophylline'),	  	  	 	  	  	 
	('Traditional medicines','Traditional medicines'), 	  	  	   	  	 
	('Vancomycin', 'Vancomycin'), 	  	  	 
	('Vitamins(iron,B12,Folate)', 'Vitamins(iron,B12,Folate)'),
)


MUSCULOSKELETAL_ABNORMALITY = (
    ('None', 'None'),
    ('Craniosynostosis', 'Craniosynostosis'),	
    ('Torticollis', 'Torticollis'), 	
    ('Congenital scoliosis, lordosis', 'Congenital scoliosis, lordosis'), 	
    ('Congenital dislocation of hip', 'Congenital dislocation of hip'), 	
    ('Talipes equinovarus (club feet excluding metatarsus varus)', 'Talipes equinovarus (club feet excluding metatarsus varus)'), 	
    ('Funnel chest or pigeon chest (pectus excavatum or carinaturn)', 'Funnel chest or pigeon chest (pectus excavatum or carinaturn)'), 
    ('Polydactyly', 'Polydactyly'), 	
    ('Syndactyly', 'Syndactyly'), 	
    ('Other hand malformation, specify', 'Other hand malformation, specify'), 	
    ('Webbed fingers or toes', 'Webbed fingers or toes'), 	
    ('Upper limb reduction defect, specify', 'Upper limb reduction defect, specify'), 	
    ('Lower limb reduction defect, specify', 'Lower limb reduction defect, specify'), 	
    ('Other limb defect, specify', 'Other limb defect, specify'), 	
    ('Other skull abnormality, specify', 'Other skull abnormality, specify'), 	
    ('Anthrogryposis', 'Anthrogryposis'), 	
    ('Vertebral or rib abnormalities, specify', 'Vertebral or rib abnormalities, specify'), 	
    ('Osteogenesis imperfecta', 'Osteogenesis imperfecta'), 	
    ('Dwarfing syndrome, specify', 'Dwarfing syndrome, specify'),
    ('Congenital diaphramatic hernia', 'Congenital diaphramatic hernia'), 	
    ('Omphalocele', 'Omphalocele'), 	
    ('Gastroschisis', 'Gastroschisis'), 	
    ('OTHER', 'Other muscular or skeletal abnormality or syndrome, specify'),  
)


OTHER_DEFECT = (
    ('None', 'None'),
    ('OTHER', 'Other defect/syndrome not already reported, specify'),     
) 

PRIOR_PREG_HAART_STATUS = (
    ('Received continuos HAART from the time she started', 'Received continuos HAART from the time she started'),
    ('Had treatment interruption but restarted ', 'Had treatment interruption but restarted HAART prior to this pregnancy'),
    ('interruption never restarted','Had treatment interruption and never restarted HAART prior to this pregnancy' ),
)    


RECRUIT_SOURCE = (
    ('Poster/pamphlet at ANC','Recruitment poster/pamphlet at ANC'),
    ('ANC clinic staff', 'ANC clinic staff'),
    ('Staff at site of delivery', 'Staff at site of delivery'),
    ('BHP recruiter', 'BHP recruiter'),
    ('OTHER', 'Other, specify'),   
)  


RECRUIT_CLINIC = (
    ('PHH', 'Gaborone(PMH)'),
    ('SLH', 'Molepolole(SLH)'),
    ('ATHLONE', 'Lobatse(Athlone)'),
    ('G.West Clinic', 'G.West Clinic'),
    ('Old Naledi Clinic','Old Naledi Clinic'),
    ('BH3 Clinic', 'BH3 Clinic'),
    ('Mafitlhakgosi Clinic','Mafitlhakgosi Clinic'),
    ('Tsopeng Clinic', 'Tsopeng Clinic'),
    ('Peleng East Clinic', 'Peleng East Clinic'), 
    ('Tlokweng main','Tlokweng Main Clinic'),
    ('Khayakhulu', 'Khayakhulu Clinic'),
    ('Nkoyaphiri','Nkoyaphiri Clinic'),
    ('Phuthadikobo','Phuthadikobo Clinic'),
    ('Boribamo','Boribamo Clinic'),
    ('Borakalalo','Borakalalo Clinic'),
    ('Bokaa','Bokaa Clinic'),
    ('Kgosing','Kgosing Clininc'),
    ('MCC', 'Molepolole Community Centre'),
    ('OTHER health facility', 'Other health facilities not associated with study site'),
    ('HOME', 'Home'),
    ('OTHER location', 'Other location'), 
)  
    
    
RENAL_ANOMALY = (
    ('None', 'None'),
    ('Bilateral renal agenesis', 'Bilateral renal agenesis'),	
    ('Unilateral renal agenesis or dysplasia', 'Unilateral renal agenesis or dysplasia'), 	
    ('Polycystic kidneys', 'Polycystic kidneys'), 	
    ('Congenital hydronephrosis', 'Congenital hydronephrosis'), 	
    ('Unilateral stricture, stenosis, or hypoplasia', 'Unilateral stricture, stenosis, or hypoplasia'), 	
    ('Duplicated kidney or collecting system', 'Duplicated kidney or collecting system'),	
    ('Horseshoe kidney', 'Horseshoe kidney'), 	
    ('Exstrophy of bladder', 'Exstrophy of bladder'),	
    ('Posterior urethral valves', 'Posterior urethral valves'),	
    ('OTHER', 'Other renal, ureteral, bladder, urethral abnormality, specify'), 
)    
    
REASON_FOR_HAART = (

    ('maternal masa', '1. HAART for maternal treatment (qualifies by Botswana guidelines)'),
    ('pmtct bf', '2. HAART for PMTCT while breastfeeding'),
    ('pp arv tail', '3. Brief postpartum antiretroviral "tail"'),
    ('unsure', '4. Unsure'),
    ('OTHER', '9. OTHER'),
    ('N/A', 'Not applicable'),
)    
    
RESPIRATORY_DEFECT = (
    ('None', 'None'),  	
    ('Choanal atresia', 'Choanal atresia'), 	
    ('Agenesis or underdevelopment of nose', 'Agenesis or underdevelopment of nose'),	
    ('Nasal cleft', 'Nasal cleft'), 	
    ('Single nostril, proboscis', 'Single nostril, proboscis'),	
    ('OTHER nasal or sinus abnormality', 'Other nasal or sinus abnormality, specify'), 	
    ('Lryngeal web. glottic or subglottic', 'Lryngeal web. glottic or subglottic'),	
    ('Congenital laryngeal stenosis', 'Congenital laryngeal stenosis'),	
    ('OTHER laryngeal, tracheal or bronchial anomalies', 'Other laryngeal, tracheal or bronchial anomalies'),	
    ('Single lung cyst', 'Single lung cyst'),	
    ('Polycystic lung', 'Polycystic lung'), 	
    ('OTHER', 'Other respiratory anomaly, specify'), 	
)


SKIN_ABNORMALITY = ( 
    ('None', 'None'),
    ('Icthyosis', 'Icthyosis'), 	
    ('Ectodermal dysplasia', 'Ectodermal dysplasia'), 	
    ('OTHER', 'Other skin abnormality, specify'), 
)


TOILET_FACILITY = (
    ('Indoor toilet', 'Indoor toilet'),
    ('Private latrine for your house/compound', 'Private latrine for your house/compound'),
    ('Shared latrine with other compounds', 'Shared latrine with other compounds'),
    ('No latrine facilities', 'No latrine facilities'),
    ('OTHER', 'Other, specify'),
)    

TRISOME_CHROSOMESOME_ABNORMALITY = (
    ('None', 'None'),
    ('Trisomy 21', 'Trisomy 21'),	
    ('Trisomy 13', 'Trisomy 13'),	
    ('Trisomy 18', 'Trisomy 18'), 	
    ('OTHER trisomy, specify', 'Other trisomy, specify'),	
    ('OTHER non-trisomic chromosome', 'Other non-trisomic chromosome abnormality, specify'),
)     

WATER_SOURCE = (
    ('Piped directly into the house', 'Piped directly into the house'),
    ('Tap in the yard', 'Tap in the yard'),
    ('Communal standpipe', 'Communal standpipe'),
    ('OTHER', 'Other water source (stream, borehole, rainwater, etc)'),
)

NEXT_FEEDING_CHOICE = (
    ('Exclusive BF', 'Exclusive breastfeeding '),
    ('Exclusive FF', 'Exclusive formula feeding '),
    ('MIX', 'A mix of breast and formula feeding '),
    (' I don\'t know', ' I don\'t know '),
)

FEEDING_DURATION = (
    ('Too long ', 'Too long '),
    ('Too short ', 'Too short '),
)

CORRECT_BF_DURATION = (
    ('Less than 6 months ', 'Less than 6 months '),
    ('6 months','6 months'),
    ('Between 6 and 12 months ', 'Between 6 and 12 months '),
    ('12 months ', '12 months '),
    ('Greater than 12 months ', 'Greater than 12 months '),
    (' I don\'t know', ' I don\'t know '),
)

SIX_MONTHS_FEEDING = (
    ('FF from birth', 'Formula feeding from birth (no breastfeeding) '),
    ('BF period', 'Breastfeeding for any period '),
    ('Other, (Describe)', 'Other, (Describe)'),
)

HIV_INSIDE_DISCLOSURE = (
    ('0 persons in my household ', '0 persons in my household '),
    ('1 persons in my household ', '1 persons in my household '),
    ('2 people in my household ', '2 people in my household'),
    ('3 or more people in my household ', '3 or more people in my household '),
)

HIV_OUTSIDE_DISCLOSURE = (
    ('0 persons outside my household ', '0 persons outside my household '),
    ('1 person outside my household ', '1 person outside my household '),
    ('2 people outside my household ', '2 people outside my household '),
    ('3 or more people outside my household ', '3 or more people outside my household '),
)

TIME_AFTER_DELIVERY = (
    ('1 month after delivery ', '1 month after delivery '),
    ('2 months after delivery ', '2 months after delivery '),
    ('3 months after delivery ', '3 months after delivery '),
    ('4 or more months after delivery ', '4 or more months after delivery '),
    ('NA', 'Not Applicable'),
)

AGREEING_TERMS = (
    ('Strongly disagree ', 'Strongly disagree '),
    ('Disagree', 'Disagree'),
    ('Neither agree or disagree ', 'Neither agree or disagree '),
    ('Agree', 'Agree'),
    ('Strongly agree ', 'Strongly agree '),
)

DECIDED_FEEDING_CHOICE = (
    ('Before the last trimester of this pregnancy ', 'Before the last trimester of this pregnancy '),
    ('During the last trimester of this pregnancy ', 'During the last trimester of this pregnancy '),
    ('At the labour and delivery ward prior to delivery ', 'At the labour and delivery ward prior to delivery '),
    ('At the maternity ward after delivery ', 'At the maternity ward after delivery '),
)

#FOR THE TAB STUDY
ARV_REGIMEN = [
    ('ftc', '1TDF/FTC/EFV'),
    ('3tc', 'TDF+3TC+EFV'),
]

DRUG_TAKE = [
    ('very_poor', 'Very Poor'),
    ('poor', 'Poor'),
    ('fair', 'Fair'),
    ('good', 'Good'),
    ('very_good', 'Very_Good'),
    ('excellent', 'Excellent'),
]

INFO_SOURCE = [
    ('self', 'Self report'),
    ('idcc', 'IDCC record'),
    ('OTHER', 'Other, specify'),
]
