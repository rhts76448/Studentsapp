 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
 <!DOCTYPE html>
<html>
<title>Student's aPP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">

<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body background="Images/1.jpg"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>
 <div class="w3-content" style="max-width:2000px;margin-top:46px">
   <%@ include file="About.jsp" %>
   <%@ include file="Team.jsp" %>
 <%@ include file="Contact.jsp" %>
     
<!-- End Page Content -->
</div>
<%@ include file="Footer.jsp" %>

</body>
</html>
 