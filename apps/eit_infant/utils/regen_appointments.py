"""infant registration forms """

for rs in RegisteredSubject.objects.filter(subject_type='infant'):
    if InfantBirth.objects.filter(registered_subject=rs):
        membership_form = InfantBirth.objects.get(registered_subject=rs)
        Appointment.objects.create_appointments( 
            registered_subject = rs, 
            base_appt_datetime = membership_form.created, 
            model_name = membership_form.__class__.__name__.lower(),
            )
        print rs.subject_identifier

        
for rs in RegisteredSubject.objects.filter(subject_type='infant'):
    if InfantEligibility.objects.filter(registered_subject=rs):
        membership_form = InfantEligibility.objects.get(registered_subject=rs)
        Appointment.objects.create_appointments( 
            registered_subject = rs, 
            model_name = membership_form.__class__.__name__.lower(),
            )
        print rs.subject_identifier        
        
        
rs = RegisteredSubject.objects.get(subject_identifier='056-1980301-0-10')
membership_form = InfantBirth.objects.get(registered_subject=rs)
        Appointment.objects.create_appointments( 
            registered_subject = rs, 
            base_appt_datetime = membership_form.created, 
            model_name = membership_form.__class__.__name__.lower(),
            )
membership_form = InfantEligibility.objects.get(registered_subject=rs)
Appointment.objects.create_appointments( 
    registered_subject = rs, 
    base_appt_datetime = membership_form.created, 
    model_name = membership_form.__class__.__name__.lower(),
    )

