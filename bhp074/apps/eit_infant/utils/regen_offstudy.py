for rs in RegisteredSubject.objects.filter(subject_type='infant'):
    if InfantOffStudy.objects.filter(registered_subject=rs):
        infant_off_study =  InfantOffStudy.objects.get(registered_subject=rs)
        Appointment.objects.filter(
            registered_subject=rs, 
            appt_datetime__gt=infant_off_study.offstudy_date, 
            infantvisit__isnull=True
            ).delete()    
        print rs.subject_identifier
        
for rs in RegisteredSubject.objects.filter(subject_type='maternal'):
    if MaternalOffStudy.objects.filter(registered_subject=rs):
        maternal_off_study =  MaternalOffStudy.objects.get(registered_subject=rs)
        Appointment.objects.filter(
            registered_subject=rs, 
            appt_datetime__gt=maternal_off_study.offstudy_datetime, 
            maternalvisit__isnull=True
            ).delete()    
        print rs.subject_identifier     
