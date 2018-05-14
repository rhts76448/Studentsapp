<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <%@page import="com.students.bean.FeedbackBean"%>
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
.quarter{width:45%;float:center;}
.inp{max-width:250px; width:75%; float:center;}
</style>
<script>
var jsArr=new Array();
<%
for (int j=0; j < brch1.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch1[j] %>';
<%}%>

function add()
{
	document.getElementById("revConsole").style.display='none';
	document.getElementById("addConsole").style.display='block';
}
function rev()
{
	document.getElementById("addConsole").style.display='none';
	document.getElementById("revConsole").style.display='block';
	console=document.getElementById("console");
	console.innerHTML="";
	 for(var i=0; i<jsArr.length; i++)
	  {
		 var par=document.createElement("p");
		 par.id="p"+i;
		 par.className="w3-white w3-round-xxlarge";
		 //par.style.width="45%";
		 par.innerHTML="&nbsp;&nbsp"+jsArr[i];
		 var chk=document.createElement("input");
		 chk.type="checkbox";
		 chk.name="branches";
		 chk.value=jsArr[i];
		 chk.className="w3-right";
		 par.appendChild(chk);
		 console.appendChild(par);
	  }
}
function bodyLoad()
{
document.getElementById("revConsole").style.display='none';
document.getElementById("addConsole").style.display='none';
}
</script>
<body onload="bodyLoad()"> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
String flag=(String)session.getAttribute("addFlag");
session.removeAttribute("addFlag");
%>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>
<form action="./MngBranch"method="post">
<!-- Page Container -->
<div class="w3-container w3-content w3-padding-64 w3-center w3-card-2" style="max-width:800px">
<br>
<%if(flag!=null){%>
<h3 class="w3-text-red w3-center"><%=flag %></h3>
<%} %>
<h3 class="w3-blue w3-round-xxlarge w3-center">Manage Branch</h3>
<div class="w3-col w3-round-xxlarge" id="buttons">
     <input type="button" onclick="add()" class="w3-button w3-blue quarter w3-round-xxlarge" value="Add Branch"/>
     <input type="button" onclick="rev()" class="w3-button w3-blue quarter w3-round-xxlarge" value="Remove Branch"/>
</div> 
<br>
<div id="revConsole" class="w3-container w3-center">
<br>
<div id="console" align="justify"></div>
<p><input type="submit" name="btn" class="w3-button w3-round-xxlarge w3-blue w3-center" value="Remove"></p>
</div>
<div id="addConsole" class="w3-container w3-center">
<br>
<p><input type="text" name="branch" id="branch" class="inp w3-round-xxlarge w3-center"/></p>
<p><input type="submit" name="btn" class="w3-button w3-round-xxlarge w3-blue w3-center" value="Add" onclick="return chk()"></p>
</div>
  <!-- End Page Container -->
</div>
</form>
<script>
function chk()
{
	brch=document.getElementById("branch").value;
	if(brch==null)
		{
		alert("Entre branch name");
		return false;
		}
	else
		{
		return true;
		}
	}</script>

<%@ include file="Footer.jsp" %>
</body>
</html>
    