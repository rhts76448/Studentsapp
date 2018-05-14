<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="com.students.bean.Profile"%>
      <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
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
.qtr{width:45px;float:center;}
.btn{width:38%;float:center;}
.third{width:33%;float:left}
</style>
<script>
window.addEventListener("orientationchange", function(e) {
      if(window.innerHeight < window.innerWidth){
      alert("Please use LandScape mode!");
  }});
  function chkMark(i)
  {
	  tmark=parseFloat(document.getElementById("mark").value);
	  mark=parseFloat(document.getElementById("mark"+i).value);
	  n=document.getElementById("no").value;
	  if(mark>tmark)
		  {
		  alert("mark can't be greater then total mark");
		  document.getElementById("btn").setAttribute("disabled", true);
		  for(var j=0;j<n;j++)
			  {
			  if(j==i)
				  continue;
			  else
			  document.getElementById("mark"+j).setAttribute("disabled", true);
			  }
		  }
	  else
		  {
		  document.getElementById("btn").removeAttribute("disabled");
		  for(var j=0;j<n;j++)
		  {
		  document.getElementById("mark"+j).removeAttribute("disabled");
		  }
		  }
  }
  </script>
<body> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
String flag=(String)session.getAttribute("flag");
session.removeAttribute("flag");
Profile[] ob=(Profile[])session.getAttribute("students");
String subject=(String)session.getAttribute("subject");
%>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>

<!-- Page Container -->
<div class="w3-container w3-card-2 w3-content w3-padding-64" style="max-width:800px">
<br>
<%
 int m=0;if(flag!=null) {%>
<div class="w3-center w3-text-red"><%=flag %></div>
<%} %>
<h3 class="w3-blue w3-round-xxlarge w3-center">Update Marks</h3>
<br>
<form action="./UpdateMarks" method="post"> 
<p class="w3-button w3-white w3-round-xxlarge w3-center">Subject:<%=subject %></p>
<div class="w3-white w3-round-xxlarge">
<span class="w3-left w3-button w3-white w3-round-xxlarge">Internal no:<input type="number" name="internal" id="internal" class="w3-blue" required="" style="width:40px;float:right;"/></span>
<span class="w3-right w3-button w3-white w3-round-xxlarge">Total Marks:<input type="number" name="mark" id="mark" class="w3-blue" required="" style="width:60px;float:right;"/></span></div>
<div>
<p class="w3-col w3-white w3-round-xxlarge w3-center">
<span class="quarter">sl.no</span>
<span class="quarter">Regd.no</span>
<span class="quarter">Name</span>
<span class="quarter">Marks</span>
</p>
<%for(int i=0;i<ob.length;i++) {
String mark="mark"+i;
String regd="regdno"+i;
String name="name"+i;
m++;
%>
<p class="w3-col w3-white w3-round-xxlarge w3-center">
<span class="quarter"><%=m %></span>
<span class="quarter"><%=ob[i].getRegdno() %><input type="hidden" name=<%=regd %> value=<%=ob[i].getRegdno() %>></span>
<span class="quarter"><%=ob[i].getName() %><input type="hidden" name=<%=name %> value=<%=ob[i].getName() %>></span>
<span class="quarter"><input type="number" required="" name=<%=mark %> id=<%=mark %> onblur="chkMark(<%=i %>)" class="qtr w3-blue"></span>
</p>
<%} %>
<p class="w3-col w3-round-xxlarge w3-center">
<input type="hidden" name="no" id="no" value="<%=m %>">
<input type="submit" name="updatemarks" id="btn" class="w3-button w3-blue w3-round-xxlarge " value="submit"/></p>
</div>

</form>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>