<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.students.dbconn.DataIn"%>
 <%
 String[] brch=DataIn.getBranch();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
 <link rel="Shortcut icon" href="Images/favicon.ico">
<title>Student's app:signup</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Perfect Match Register Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />

<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="css/signup1.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/signup2.css" />
<!-- //css files -->
<!-- web-fonts -->
<link href="fonts/1.woff" rel="stylesheet">
<link href="fonts/2.woff" rel="stylesheet">

<!-- //web-fonts -->
<style>

.w3-black,.w3-hover-black:hover{color:#fff!important;background-color:#000!important}
.w3-select{padding:9px 0;width:59%;border:none;border-bottom:1px solid #ccc}
</style>

<script>
var jsArr = new Array();
<%
for (int j=0; j < brch.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch[j] %>';
<%}%>
function getBranch()
{
	bodyLoad();
	 brch= document.getElementById("branch");
	  
	  for(var i=0; i<jsArr.length; i++)
	  {
	     var opt = document.createElement("option");
	     opt.text=jsArr[i];
	     opt.value=jsArr[i];
	     brch.appendChild(opt);
	  }
}
function bodyLoad()
	{
	pass2=document.getElementById("password2");
	pass2.setAttribute("disabled", true);
	document.getElementById("pcnf").innerHTML="";
	document.getElementById("ltr").style.display='none';
}
</script>
<script src="js/valid.js"></script>
</head>
<body onload="getBranch()">

<noscript>
<style type="text/css">
.center-container{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1>Student's app : Sign Up Form</h1>
		</div>
		<!--//header-->
		<!---728x90--->
		<!--main-->
	<div class="agileits-register">
		<form action="./Sign" method="post">
				
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Name:</span>
					<input type="text" name="name" id="name" placeholder="Your Name" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Registration No:</span>
					<input type="text" name="regd" id="regd" placeholder="Registration No" required="" onblur="chkRegd()" onkeyup="bodyLoad()"/>
					<div class="clear"> </div>
				</div >
				<div>
				<font color="red">
				<span id="rgd"></span>
				</font>
				<font color="lime">
				<span id="ltr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="lateral" id="lateral" value="2"/>Are you lateral entry?</span>
				</font>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Branch:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select class="w3-select w3-black" name="branch" id="branch">
					<option value=-1>Select your branch</option>
					</select>
					<div class="clear"> </div>
				</div >
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Date Of Birth:</span>
					<input class="date" name="dob" id="dob" type="date" placeholder="dd/mm/yyyy" required="" />
					<div class="clear"> </div>
				</div>
				
				<div class="w3_modal_body_grid">
					<span>Gender:</span>
					<div class="w3_gender">
						<div class="colr ert">
							<label class="radio"><input type="radio" name="gender" checked value="male"><i></i><b>Male</b></label>
						</div>
						<div class="colr">
							<label class="radio"><input type="radio" name="gender" value="female"><i></i><b>Female</b></label>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
				</div>	
				<br>
				<div class="w3_modal_body_grid">
					<span>Email:</span>
					<input type="email" name="mail" id="mail" placeholder="Your E-mail" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Phone Number</span>
					<input type="text" name="phone_number" id="phone_number" placeholder="Your Phone Number" required="" onblur="chkPhone(this.value,pcnf)"/>
					<div class="clear"> </div>
				</div>
				<div>
				<font color="red">
				<span id="pcnf"></span>
				</font>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Password:</span>
					<input type="password" name="Password1" id="password1" placeholder="Min 6 and Max 20" title="password should be in between 6 to 20 characters" required="" onkeyup="chkPass()"/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Confirm Password:</span>
					<input type="password" name="password2" id="password2" placeholder="Confirm Password " required="" onblur="cnfPass()"/>
					<div class="clear"></div>
				</div>

				<div>
				<font color="red">
				<span id="cnf"></span>
				</font>
				</div>
								
					<input type="submit" value="Sign Up" />
				<div class="clear"></div>
			</form>
			<div align="right">
				<form name="submitForm" method="POST" action="./Signin">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm.submit()">Already have an account?</a>
				</font>
				</form>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		<!--//main-->
		<!---728x90--->
		<!--footer-->
		<div class="footer">
			<h2>&copy; 2018 Student's app sign up form. All rights reserved | Designed by SRP</h2>
		</div>
		<!--//footer-->
		<!---728x90--->
	</div>
</body>
</html>


