 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 	  <%@page import="com.students.bean.Profile"%>
 <!DOCTYPE html>
<html>
<title>Student's aPP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<%@ include file="subjects.jsp" %>
<%@ include file="Loader.jsp" %>
<body onload="bodyLoad()"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>
 <div class="w3-content" style="max-width:2000px;margin-top:46px">
<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<h2 class=" w3-center w3-blue w3-round-xxlarge">Promot Semester</h2>
<br>
<%
String[] s=DataIn.getSem();
%>
<div>
<form action="./PromotSem" method="post">
<%
for(int i=0;i<s.length;i++)
{
	if(Integer.parseInt(s[i])<8)
	{
%>
<div class="w3-center"> <input type="submit" value="<%=s[i] %> to <%=Integer.parseInt(s[i])+1 %>&nbsp;Semester" name="sem" class="w3-wide w3-button w3-center w3-blue w3-round-xxlarge"></div>
<%}} %>
</form>
</div>
</div>
<!-- End Page Content -->
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
 