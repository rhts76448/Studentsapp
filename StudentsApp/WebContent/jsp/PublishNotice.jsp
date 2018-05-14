<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <%String[] brch1=DataIn.getBranch();//retriving branch %>
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
.quarter{width:25%;float:left;}
</style>

<script>
window.addEventListener("orientationchange", function(e) {
      if(window.innerHeight < window.innerWidth){
      alert("Please use LandScape mode!");
  }});
</script>
<body onload="getBranch()"> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
String flag=(String)session.getAttribute("flag");
session.removeAttribute("flag");
%>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>

<!-- Page Container -->
<div class="w3-container w3-card-2 w3-content w3-padding-64 w3-center" style="max-width:800px">
<br>
<%if(flag!=null) {%>
<div class="w3-center w3-text-red"><%=flag %></div>
<%} %>
<form action="./NoticeBoard" method="post">
<h3 class="w3-blue w3-round-xxlarge w3-center">Notice Board</h3>
<br> 
<h4 class="w3-blue w3-round-xxlarge w3-center">Subject</h4>
<p class="w3-input"><input type="text" name="subject" required="" class="w3-input w3-round-xxlarge w3-text-blue" placeholder="e.g: holiday/Exam/Function"></p>
<h4 class="w3-blue w3-round-xxlarge w3-center">Details</h4>
<p class="w3-input"><textarea rows="3" class="w3-input w3-text-blue" name="details" required="" placeholder="e.g event date & description..."></textarea>
<h4 class="w3-center w3-round-xxlarge"><button class="w3-button w3-round-xxlarge w3-center w3-blue">Submit</button></h4>
</form>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>