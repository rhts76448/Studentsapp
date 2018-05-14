<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
     <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
 <!DOCTYPE html>
<html>
<head>
<title>Student's aPP : Attendance</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">

<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}

#rcorners1 {
    border-radius: 25px;
    background: #73AD21;
    padding: 20px; 
    width: 200px;
    height: 150px;

</style>
</head>
<body> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%@ include file="Nav.jsp" %>

 <form action="./GiveAttendance">
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<br>
<h2 class="w3-wide w3-center w3-blue w3-round-xxlarge">Attendance</h2>
<br>
<h3 class="w3-center w3-text-blue">Enter the Code:</h3>
<div class="w3-center">
<input type="number" name="otp" id="otp" required="" class="w3-center w3-input w3-white w3-round-xxlarge" style="max-width:320px">
<%
String msg=(String)session.getAttribute("flag");
session.removeAttribute("flag");
if(msg!=null){
%>
<p class="w3-text-blue"><%=msg %></p>
<%} %>
<br>
<input type="submit" class="w3-button w3-blue w3-round-xxlarge" value="Submit">
<p class="w3-text-red">
Note:*-The OTC is valid only for 5 minutes of it's generated time.
</p>
</div>
 </div>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>