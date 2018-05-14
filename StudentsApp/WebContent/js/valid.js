
function chkRegd()
	{
	regd=document.getElementById("regd").value;
	rv=regd.toUpperCase();
	c=rv.charAt(0);
	ch=rv.substr(0, 2);
	rd=parseInt(ch);
	year=new Date().getFullYear().toString().substr(-2);
	yrp=parseInt(year);
	yr=yrp-4;
	if(rv.length==10)
		{
		rgd.innerHTML="";
		if(!(rd>=yr && rd<=yrp) && (c !== "T"))
			{
			document.getElementById("regd").value='';
			rgd.innerHTML="please input a valid registration no";
			}
		else
			{
			if(c!=="T")
				{
				document.getElementById("ltr").style.display='block';
				}
			}
		}
	else
	{
	document.getElementById("regd").value='';
	rgd.innerHTML="please input a valid registration no";
	}
	}
function chkPass()
	{
		pass1=document.getElementById("password1").value;
		pass2=document.getElementById("password2");
		 
		if(pass1.length>6 && pass1.length<21)
			{
			pass2.removeAttribute('disabled');
			}
		else
			{
			pass2.setAttribute("disabled", true);
			}
		
	}
function cnfPass()
	{
	pass1=document.getElementById("password1").value;
	pass2=document.getElementById("password2").value;
	cnf=document.getElementById("cnf");
	
	if(pass2==pass1)
		{
		cnf.innerHTML="";
		}
	else
		{
		cnf.innerHTML="password didn't match";
		pass2=document.getElementById("password2").value='';
		}
		
	
	}
function chkPhone(number,cnf)
{
	
	var val = /^\d{10}$/;
	if(number.match(val))
		{
		cnf.innerHTML="";
		}
	else
		{
		cnf.innerHTML="Enter a valid phone no";
		document.getElementById("phone_number").value='';
		}
	}
function chkPin(number,cnf)
{
	var val = /^\d{6}$/;
	if(number.match(val))
		{
		cnf.innerHTML="";
		}
	else
		{
		cnf.innerHTML="Enter a valid PIN code";
		document.getElementById("pin").value='';
		}
	}