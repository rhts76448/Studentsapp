<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
     <%@page import="com.students.dbconn.DataIn"%>
      <%@page import="com.students.core.Checker"%>
     <%@page import="com.students.bean.Profile"%>
 <!DOCTYPE html>
<html>
<head>
<title>Student's aPP : Feedback Hub</title>
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
<script type="text/javascript">
function getResult(j)
{
	console=document.getElementById(j);
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    } else { 
        console.className = console.className.replace(" w3-show", "");
    }
}
</script>
</head>
<body onload="bodyload()"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%@ include file="AdminNav.jsp" %>
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center" id="status"></div>
<h2 class="w3-round-xxlarge w3-center w3-blue w3-text-white">Faculty List</h2>
 <%
 Profile[] facultyList=DataIn.getFcltyList2();
 %>
 <br>
 <p class="w3-input w3-white w3-center w3-text-blue w3-round-xlarge">&nbsp;Total no. of Faculties:&nbsp;&nbsp;<%=facultyList.length  %></p>
 <div class="w3-center">
 <%
String m="s";
for(int i=0;i<facultyList.length;i++){
	if(Checker.notEquals(m, facultyList[i].getBranch())){%>
<p><input type="button" onclick="getResult(this.value)"class="w3-button w3-blue w3-round-xlarge " value="<%=facultyList[i].getBranch() %>"/></p>
<%m=facultyList[i].getBranch(); %>
<div id="<%=facultyList[i].getBranch() %>" class="w3-hide">
<%
for(int j=0;j<facultyList.length;j++){
	if(m.equals(facultyList[j].getBranch())){%>
<div class="w3-input w3-white w3-text-blue w3-round-xlarge" align="justify"><%=j+1 %>&nbsp;&nbsp;<%=facultyList[j].getName()  %></div>
<%}}%>
</div>
<%}} %>
 
 </div>
 
 </div>     
<%@ include file="Footer.jsp" %>
</body>
</html>