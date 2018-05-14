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
  <div id="selector">
   <form action="./Attendence" >
<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<h2 class=" w3-center w3-blue w3-round-xxlarge">Attendance Sheet</h2>
<h3 class="w3-center w3-blue w3-round-xxlarge">Semester</h3>
<div class="w3-blue w3-round-xxlarge w3-center">
<select name="semester" id="semester" class="w3-select w3-round-xxlarge w3-center w3-white" required="" onchange="getSubject()">
<option value="-1">choose semester</option>
<option value="1">1st Semester</option>
<option value="2">2th Semester</option>
<option value="3">3th Semester</option>
<option value="4">4th Semester</option>
<option value="5">5th Semester</option>
<option value="6">6th Semester</option>
<option value="7">7th Semester</option>
<option value="8">8th Semester</option>
</select>
</div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Branch</h3>
<div class=" w3-blue w3-round-xxlarge w3-center"><select class="w3-select w3-center w3-round-xxlarge w3-white w3-center" name="branch" id="branch" onchange="getSubject()" required=""><option value="-1">Choose branch</option></select></div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Subject</h3>
<div class="w3-blue w3-round-xxlarge w3-center"><select id="subject" name="subject" class="w3-center w3-select w3-round-xxlarge w3-white" required=""><option value="-1">choose subject</option></select></div>
<div class="w3-center">
<input type="button" value=" " class="w3-button w3-third w3-round-xxlarge w3-center">
<input type="submit" value="view" name="click" class="  w3-button w3-blue w3-round-xxlarge w3-center" onclick="return selectChk()">
</div></div>
<script>

function selectChk()
{
	sub= document.getElementById("subject").value;
	brch=document.getElementById("branch").value;
	sem=document.getElementById("semester").value;
	if(sub=="-1" || sem=="-1" || brch=="-1")
		{
		alert("please select all elements");
		v=false;
		}
	else
		v=true;
	return v;
}
</script>
</form>
  </div>
  <%
  String nice=(String)session.getAttribute("nice");
  session.removeAttribute("nice");
  if(nice!=null){
  %>
  <div id="vvv">
  <form action="./AttendanceAction">
<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<div class="w3-center w3-col">
 <%
 String[] ob=(String[])session.getAttribute("attdt");
 session.removeAttribute("attdt");
 if(ob.length<1){
	 %>
	 <div class="w3-center w3-text-red">No data found</div>
	 <%}else{%>
	 <p class="w3-input w3-white w3-text-blue w3-round-xxlarge">Total no of class: <%=ob.length%></p>
<table align="center" id="sheet">
 
<% 
 for(int i=0;i<ob.length;i++)
 {
 %>
 <tr align="center">
 <td> <input type="submit" value=<%=ob[i] %> name="attdt" class="w3-wide w3-button w3-center w3-blue w3-round-xxlarge"></td>
 </tr>
<%} %>
 </table>
 <%} %>
 </div>
 </div>
</form>
  </div>
  <%}
  String view=(String)session.getAttribute("view");
  session.removeAttribute("view");
  if(view!=null){
  %>
  <div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center w3-col">
<div class="w3-center" id="sheet">
 
 <%
 Profile[] ob=(Profile[])session.getAttribute("sview");
 String sub=(String)session.getAttribute("sub");
 if(ob.length<1){
 %>
 <div class="w3-center w3-text-red">No data found</div>
 <%} else{%>
 <p class="w3-input w3-white w3-text-blue w3-round-xxlarge">Total no of Students attended: <%=ob.length%></p>
 <% for(int i=0;i<ob.length;i++){ %>
 <div class="w3-col w3-white w3-round-xxlarge w3-center">
 <span class="third"><%=i+1 %></span>
 <span class="third"><%=ob[i].getRegdno()%></span>
<span class="third">&nbsp;&nbsp;<%=ob[i].getName() %></span>
</div>
<%} }%>
 </div>
 </div>
 </div>
  <%} %>
  
<!-- End Page Content -->
</div>
<%@ include file="Footer.jsp" %>

</body>
</html>
 