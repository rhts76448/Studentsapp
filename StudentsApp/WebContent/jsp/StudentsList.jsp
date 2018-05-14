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
var jsArr = new Array();
<%
String[] brch1=DataIn.getBranch();//retriving branch
for (int j=0; j < brch1.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch1[j] %>';
<%}%>

function bodyLoad()
	{
	
  brch= document.getElementById("branch");
  
  for(var i=0; i<jsArr.length; i++)
  {
     var opt = document.createElement("option");
     opt.text=jsArr[i];
     opt.value=jsArr[i];
     brch.appendChild(opt);
  }
}
</script>
</head>
<body onload="bodyLoad()"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%@ include file="AdminNav.jsp" %>
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center" id="status"></div>
<h2 class="w3-round-xxlarge w3-center w3-blue w3-text-white">Students List</h2>
 <%
 Profile[] studentsList=(Profile[])session.getAttribute("students");
 session.removeAttribute("students");
 session.setAttribute("nice", "nice");
 %>
 <br>
 <div id="getList" class="w3-center">
<form action="./getStudents"method="post">
<h3 class="w3-center w3-blue w3-round-xxlarge">Branch</h3>
<div class="w3-blue w3-round-xxlarge w3-center"><select class="w3-select w3-center w3-round-xxlarge w3-white w3-center" name="branch" id="branch" required=""><option value="-1">Choose branch</option></select></div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Semester</h3>
<div class="w3-blue w3-round-xxlarge w3-center">
<select name="semester" id="semester" class="w3-select w3-round-xxlarge w3-center w3-white">
<option value="-1">choose semester</option>
<option value="1">1st Semester</option>
<option value="2">2nd Semester</option>
<option value="3">3rd Semester</option>
<option value="4">4th Semester</option>
<option value="5">5th Semester</option>
<option value="6">6th Semester</option>
<option value="7">7th Semester</option>
<option value="8">8th Semester</option>
</select>
</div>
<h4 class="w3-center"><input type="submit" class="w3-button w3-blue w3-round-xxlarge" value="Get Students List"/></h4>
</form>
</div>
<%
if(studentsList!=null){
%>
 <div id="list">
 <p class="w3-input w3-white w3-center w3-text-blue w3-round-xlarge">&nbsp;<%=studentsList[0].getBranch() %>&nbsp;&nbsp;<%=Checker.semEncode(studentsList[0].getSem()) %>&nbsp;Semester</p>
 <p class="w3-input w3-white w3-center w3-text-blue w3-round-xlarge">&nbsp;Total no. of Students:&nbsp;&nbsp;<%=studentsList.length  %></p>
 <div class="w3-center">
<%
for(int j=0;j<studentsList.length;j++)
	{%>
<div class="w3-input w3-white w3-text-blue w3-round-xlarge" align="justify"><%=j+1 %>&nbsp;&nbsp;<%=studentsList[j].getRegdno() %>&nbsp;&nbsp;<%=studentsList[j].getName()  %></div>
<%}%>
</div>
 </div>
 <%} %>
 </div>     
<%@ include file="Footer.jsp" %>
</body>
</html>