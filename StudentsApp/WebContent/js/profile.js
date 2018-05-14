    
        function update_add()
        {
        	uadd=document.getElementById("u_add");
        	add=document.getElementById("add");  
        	uadd.style.display='block';
        	add.style.display='none';
        }
        function update_mail()
        {
        	 umail=document.getElementById("u_mail");
        	 mail=document.getElementById("mail");
        	 umail.style.display='block';
        	 mail.style.display='none';
        }
        function update_pic()
        {
        	 upic=document.getElementById("u_pic");
        	 upic.style.display='block';
        }
        function update_contact()
        {
        	ucontact=document.getElementById("u_contact");
        	contact=document.getElementById("contact");
        	ucontact.style.display='block';
        	contact.style.display='none';
        }
        function change_pass()
        {
        	 document.getElementById("password").style.display='none';
        	 document.getElementById("u_password").style.display='block';
        }
        function conf_deactive()
        {
        	 document.getElementById("cnf_deactive").style.display='block';
        }
        function update_qua()
        {
        	 uqua=document.getElementById("u_qua");
        	 qua=document.getElementById("qua");
        	 uqua.style.display='block';
        	 qua.style.display='none';
        }
        function update_exp()
        {
        	uexp=document.getElementById("u_exp");
        	exp=document.getElementById("exp");
        	uexp.style.display='block';
        	exp.style.display='none';
        }
        function bio_personal()
        {
        	document.getElementById("bio_name").removeAttribute('disabled');
        	document.getElementById("bio_gender").removeAttribute('disabled');
        	document.getElementById("bio_gender1").removeAttribute('disabled');
        	document.getElementById("bio_dob").removeAttribute('disabled');
        	document.getElementById("bio_email").removeAttribute('disabled');
        	document.getElementById("bio_con").removeAttribute('disabled');
        	document.getElementById("bio_acon").removeAttribute('disabled');
        	document.getElementById("bio_fname").removeAttribute('disabled');
        	document.getElementById("bio_fcon").removeAttribute('disabled');
        	document.getElementById("bio_mname").removeAttribute('disabled');
        	document.getElementById("bio_mcon").removeAttribute('disabled');
        	document.getElementById("bio_p").style.display='block';

        }
        function bio_address()
        {
        	document.getElementById("bio_address").removeAttribute('disabled');
        	document.getElementById("bio_city").removeAttribute('disabled');
        	document.getElementById("bio_district").removeAttribute('disabled');
        	document.getElementById("bio_state").removeAttribute('disabled');
        	document.getElementById("bio_pin").removeAttribute('disabled');
        	document.getElementById("bio_a").style.display='block';
        }
        function bio_education()
        {
        	document.getElementById("bio_hsc").removeAttribute('disabled');
        	document.getElementById("bio_hsc_marks").removeAttribute('disabled');
        	document.getElementById("bio_hsc_pass").removeAttribute('disabled');
        	document.getElementById("bio_inter").removeAttribute('disabled');
        	document.getElementById("bio_inter_marks").removeAttribute('disabled');
        	document.getElementById("bio_inter_pass").removeAttribute('disabled');
        	document.getElementById("bio_e").style.display='block';
        }
        