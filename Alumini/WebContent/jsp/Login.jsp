<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>REC Online Alumni</title>
</head>
<body>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
<%@include file="Nav.jsp" %>
<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px">
<%
String msg=(String)session.getAttribute("msg");
session.removeAttribute("msg");
if(msg!=null)
{%>
<br>
<p class="w3-text-red"><%=msg %></p>
<%}%>
 <div class="w3-container w3-content w3-center" style="margin-top:20%;max-width:400px">
 <div>
 <form action="#" method="post">
<table class="w3-table">
<tr><td colspan="2" class="w3-cyan w3-round-xxlarge w3-text-white"><b>Log In</b></td></tr>
<tr></tr>
<tr class="w3-text-cyan"><td>Email id:</td><td><input type="email" name="email" id="email" placeholder="Email id" class="w3-input w3-text-cyan"/></td></tr>
<tr class="w3-text-cyan"><td>Password:</td><td><input type="password" name="password" id="password" placeholder="Password" class="w3-input w3-text-cyan"/></td></tr>
<tr><td colspan="2" class="w3-center"><input type="submit" value="Log In" class="w3-text-white w3-button w3-center w3-cyan w3-round-xxlarge"/></td></tr>
</table>
</form>
<div align="right" class="w3-text-cyan">
		<form name="submitForm" method="POST" action="./SignUp">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm.submit()"><b>Be an alumni member..</b></a>
				</font>
		</form>
		<br>
		<form name="submitForm1" method="POST" action="#">
				<font size=2>
				<input type="hidden" name="param1" value="param1Value">
				<a href="javascript:document.submitForm1.submit()"><b>Forgot password?</b></a>
				</font>
		</form>
		<div class="clear"></div>
		</div>
 </div>
 </div>
</div>
</div>
</body>
</html>