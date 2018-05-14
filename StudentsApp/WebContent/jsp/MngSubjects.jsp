<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 <!DOCTYPE html>
<html>
<head>
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
<script>
<%@ include file="subjects.jsp" %>

var jsArr = new Array();
var jsArrr1 = new Array();
var jsArrr2 = new Array();
var jsArrr3 = new Array();
var jsArrr4 = new Array();
var jsArrr5 = new Array();
var jsArrr6 = new Array();
var jsArrr7 = new Array();
var jsArrr8 = new Array();

<%
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
<script>
<%
for (int i=0; i < sm1.length; i++)
{
%> jsArrr1[<%=i%>] = new Array();
<%
	for(int j=0;j<sm1[i].length;j++)
		{%>
	jsArrr1[<%= i %>][<%=j%>] = '<%=sm1[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm2.length; i++)
{
%> jsArrr2[<%=i%>] = new Array();
<%
	for(int j=0;j<sm2[i].length;j++)
		{%>
	jsArrr2[<%= i %>][<%=j%>] = '<%=sm2[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm3.length; i++)
{
%> jsArrr3[<%=i%>] = new Array();
<%
	for(int j=0;j<sm3[i].length;j++)
		{%>
	jsArrr3[<%= i %>][<%=j%>] = '<%=sm3[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm4.length; i++)
{
%> jsArrr4[<%=i%>] = new Array();
<%
	for(int j=0;j<sm4[i].length;j++)
		{%>
	jsArrr4[<%= i %>][<%=j%>] = '<%=sm4[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm5.length; i++)
{
%> jsArrr5[<%=i%>] = new Array();
<%
	for(int j=0;j<sm5[i].length;j++)
		{%>
	jsArrr5[<%= i %>][<%=j%>] = '<%=sm5[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm6.length; i++)
{
%> jsArrr6[<%=i%>] = new Array();
<%
	for(int j=0;j<sm6[i].length;j++)
		{%>
	jsArrr6[<%= i %>][<%=j%>] = '<%=sm6[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm7.length; i++)
{
%> jsArrr7[<%=i%>] = new Array();
<%
	for(int j=0;j<sm7[i].length;j++)
		{%>
	jsArrr7[<%= i %>][<%=j%>] = '<%=sm7[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm8.length; i++)
{
%> jsArrr8[<%=i%>] = new Array();
<%
	for(int j=0;j<sm8[i].length;j++)
		{%>
	jsArrr8[<%= i %>][<%=j%>] = '<%=sm8[i][j] %>';
<%}}%>

function getSubject()
{
	
parent= document.getElementById("revCnsl");
parent.innerHTML="";
semster=document.getElementById("semester").value;
brch= document.getElementById("branch").value;
var j = jsArr.indexOf(brch);
switch(semster)
{
case "1":
	for(var i=0;i<jsArrr1[j].length;i++)
	{
	var prg=document.createElement("p");
	var inp = document.createElement("input");
	inp.type="checkbox";
	inp.value=jsArrr1[j][i];
	inp.name="sub";
	prg.className="w3-white w3-round-xxlarge";
	prg.innerHTML=jsArrr1[j][i];
	inp.className="w3-right";
    prg.appendChild(inp);
    parent.appendChild(prg);
	}
		break;
case "2":
	for(var i=0;i<jsArrr2[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr2[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr2[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "3":
	for(var i=0;i<jsArrr3[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr3[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr3[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "4":
	for(var i=0;i<jsArrr4[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr4[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr4[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "5":
	for(var i=0;i<jsArrr5[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr5[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr5[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "6":
	for(var i=0;i<jsArrr6[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr6[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr6[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "7":
	for(var i=0;i<jsArrr7[j].length;i++)
	{
		var prg=document.createElement("p");
		var inp = document.createElement("input");
		inp.type="checkbox";
		inp.value=jsArrr7[j][i];
		inp.name="sub";
		prg.className=" w3-white w3-round-xxlarge";
		prg.innerHTML=jsArrr7[j][i];
		inp.className="w3-right";
	    prg.appendChild(inp);
	    parent.appendChild(prg);
	}
		break;
case "8":
	
		for(var i=0;i<jsArrr8[j].length;i++)
	{
			var prg=document.createElement("p");
			var inp = document.createElement("input");
			inp.type="checkbox";
			inp.value=jsArrr8[j][i];
			inp.name="sub";
			prg.className=" w3-white w3-round-xxlarge";
			prg.innerHTML=jsArrr8[j][i];
			inp.className="w3-right";
		    prg.appendChild(inp);
		    parent.appendChild(prg);
	}
		break;
}
}
var m=0;
function add()
{
	brch=document.getElementById("branch").value;
	sem=document.getElementById("semester").value;
	if(sem=="-1" || brch=="-1")
		{
		alert("please select both(branch and semester) elements");
		v=false;
		}
else
	{
	v=true;
	brch.onchange="";
	sem.onchange="";
	if(m>9)
		document.getElementById("cnsl").innerHTML="max 10 subject can be added at a time";
	else
	{

	document.getElementById("revbtn").removeAttribute("disabled");
	document.getElementById("addbtn").setAttribute("disabled", true);
	document.getElementById("revConsole").style.display='none';
	document.getElementById("addConsole").style.display='block';
	var name=document.getElementById("addCnsl");
	var prg=document.createElement("p");
	var input=document.createElement("input");
	input.type="text";
	input.name="subject";
	input.required=true;
	input.placeholder="Enter Subject"
	input.className="w3-input w3-small w3-white w3-round-xxlarge";
	prg.appendChild(input);
	name.appendChild(prg);
	m++;
	}
	return v;
}
}
function rev()
{m=0;
	document.getElementById("addbtn").removeAttribute("disabled");
	document.getElementById("addConsole").style.display='none';
	document.getElementById("addCnsl").innerHTML="";
		brch=document.getElementById("branch").value;
		sem=document.getElementById("semester").value;
		if(sem=="-1" || brch=="-1")
			{
			alert("please select both(branch and semester) elements");
			v=false;
			}
		else
			{
			v=true;
			document.getElementById("revConsole").style.display='block';
			document.getElementById("revbtn").setAttribute("disabled", true);
			brch.onchange=function() {rev()};
			sem.onchange=function() {rev()};
			
			}
		return v;
}
var jsArr=new Array();
<%
for (int j=0; j < brch1.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch1[j] %>';
<%}%>

function bodyLoad()
{
document.getElementById("revConsole").style.display='none';
document.getElementById("addConsole").style.display='none';
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

<form action="./MngSubject"method="post">
<!-- Page Container -->
<div class="w3-container w3-content w3-padding-64 w3-center w3-card-2" style="max-width:800px">
<br>
<h2 class="w3-blue w3-round-xxlarge w3-center">Manage Subjects</h2><br>
<h3 class="w3-blue w3-round-xxlarge w3-center">Branch</h3>
<select class="w3-select quarter w3-center w3-round-xxlarge w3-white w3-center" name="branch" id="branch" onchange="getSubject()"><option value="-1">Choose branch</option></select>
<h3 class="w3-blue w3-round-xxlarge w3-center">Semester</h3>
<select name="semester" id="semester" class="quarter w3-select w3-round-xxlarge w3-center w3-white" onchange="getSubject()">
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
<br>
<h6 class="w3-col w3-round-xxlarge" id="buttons">
     <input type="button" onclick="return add()" class="w3-button w3-blue quarter w3-round-xxlarge" id="addbtn" value="Add Subjects"/>
     <input type="button" onclick="return rev()" class="w3-button w3-blue quarter w3-round-xxlarge" id="revbtn" value="Remove Subjects"/>
</h6> 
<br>
<div id="revConsole" class="w3-container w3-center">
<br>
<div id="revCnsl"></div>
<p id="cnsl2" class="w3-text-red"></p>
<p><input type="submit" name="sbjct" class="w3-button w3-round-xxlarge w3-blue w3-center" value="Remove" onclick=""></p>
</div>
<div id="addConsole" class="w3-container w3-center">
<input type="hidden" name="mn" id="mn">
<br>
<div id="addCnsl"></div>
<p id="cnsl" class="w3-text-red"></p>
<p><input type="submit" name="sbjct" class="w3-button w3-round-xxlarge w3-blue w3-center" value="Add"/>&nbsp;&nbsp;
<span><a class="w3-button w3-round-xxlarge w3-blue w3-center" onclick="add()"><i class="fa fa-plus"></i></a></span>
</p>
</div>
  <!-- End Page Container -->
</div>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>