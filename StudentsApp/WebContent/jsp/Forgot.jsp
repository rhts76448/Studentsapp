<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!
    public boolean lgst;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
 <link rel="Shortcut icon" href="Images/favicon.ico">
<title>Student's aPP:signin</title>
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
<script>
function bodyLoad()
{
	document.getElementById("pto").style.display='none';
	document.getElementById("reg").style.display='block';
	pass2=document.getElementById("password2");
	pass2.setAttribute("disabled", true);
}
function unhide()
{
	document.getElementById("reg").style.display='none';
	document.getElementById("pto").style.display='block';
}
</script>
<script src="js/valid.js"></script>
</head>
<body onload="bodyLoad()">
<noscript>
<style type="text/css">
.center-container{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
	<div class="center-container">
		<!--header-->
		<%
		String msg=(String)session.getAttribute("frgtFlag");
		session.removeAttribute("frgtFlag");
		if(msg!=null)
		{
		%>
		<h4><font color="red"><%=msg %></font></h4>
		<%} %>
		<div class="header-w3l">
			<h1>Student's app</h1>
		</div>
		<!--//header-->
		<!---728x90--->
		<!--main-->
	<div class="agileits-register">
	<div id="reg">
		<form action="./ForgotPassword" method="post">	
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Regd no:</span>
					<input type="text" name="regdno" id="regdno" placeholder="Registration no" required=""/>
					<div class="clear"> </div>
				</div>
				<input type="submit" value="send OTP" />
				<div class="clear"></div>
			</form>
			<div align="right">
				<form name="submitForm" method="POST" action="./Signin">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm.submit()">Sign in?</a>
				</font>
				</form>
				<div class="clear"></div>
			</div>
			<br>
			<div align="right">
				<font size=2>
				<a href="#" onclick="unhide()"><b>Have an OTP?</b></a>
				</font>
		<div class="clear"></div>
		</div>
			</div>
			<div id="pto">
		<form action="./ChangePassword" method="post">	
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>OTP:</span>
					<input type="text" name="otp" id="otp" placeholder="Enter the OTP" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>New Password:</span>
					<input type="password" name="password1" id="password1" placeholder="Enter new Password" onkeyup="chkPass()" required=""/>
					<div class="clear"> </div>
				</div>
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Confirm Password:</span>
					<input type="password" name="password2" id="password2" placeholder="Confirm Password" onblur="cnfPass()" required=""/>
					<div class="clear"> </div>
				</div>
				<input type="submit" value="Submit" />
				<div class="clear"></div>
			</form>
			<div align="right">
				<font size=2>
				<a href="#" onclick="bodyLoad()"><b>Don't have an OTP?</b></a>
				</font>
		<div class="clear"></div>
		</div>
		</div>		 
		</div>
		<div class="clear"></div>
		<!--//main-->
		<!---728x90--->
		<!--footer-->
		<div class="footer">
			<h2>&copy; 2018 Student's app sign in form. All rights reserved | Designed by SRP</h2>
		</div>
		<!--//footer-->
		<!---728x90--->
	</div>
</body>
</html>