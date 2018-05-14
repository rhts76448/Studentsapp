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

</head>
<body>
<noscript>
<style type="text/css">
.center-container{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1>Student's app : Sign In Form</h1>
		</div>
		<!--//header-->
		<!---728x90--->
		<!--main-->
	<div class="agileits-register">
		<form action="./Login" method="post">
				
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Email id:</span>
					<input type="text" name="username" id="username" placeholder="Email address" required=""/>
					<div class="clear"> </div>
				</div>
				
				<div class="w3_modal_body_grid w3_modal_body_grid1">
					<span>Password:</span>
					<input type="password" name="password" id="password" placeholder="Your Password " required=""/>
					<div class="clear"></div>
				</div>
				<%
				if(lgst)
				{
				%>
				<div>
				<font color="red">
				<span>Invalid Username or Password!</span>
				</font>
				</div>
				<%} %>
				<input type="submit" value="Sign In" />
				<div class="clear"></div>
			</form>
		
		<div align="right">
		<form name="submitForm" method="POST" action="./Signup">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm.submit()"><b>New to here?</b></a>
				</font>
		</form>
		<br>
		<form name="submitForm1" method="POST" action="./Forgot">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm1.submit()"><b>Forgot password?</b></a>
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
			<h2>&copy; 2018 Student's app sign in form. All rights reserved | Designed by SRP</h2>
		</div>
		<!--//footer-->
		<!---728x90--->
	</div>
</body>
</html>