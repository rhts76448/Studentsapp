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
var m=0;
var jsArr = new Array();
<%
for (int j=0; j < brch1.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch1[j] %>';
<%}%>
function getBranch()
	{
	bodyLoad();m++;
	document.getElementById("slno").innerHTML=m;
  brch= document.getElementById("branch1");
  
  for(var i=0; i<jsArr.length; i++)
  {
     var opt = document.createElement("option");
     opt.text=jsArr[i];
     opt.value=jsArr[i];
     brch.appendChild(opt);
  }
	}
function oneMore()
{
	if(m<10)
		{
	document.getElementById("sub").setAttribute("disabled", true);
	++m;
var parent=document.getElementById("cnsl");
var prt=document.createElement("div");
var sln=document.createElement("span");
var name=document.createElement("span");
var branch=document.createElement("span");
var regdc=document.createElement("span");
var br=document.createElement("br");

prt.className="w3-col w3-round-xxlarge";
parent.appendChild(prt);

name.className="quarter";
branch.className="quarter";
regdc.className="quarter";
sln.className="quarter w3-white w3-round-xxlarge w3-padding-small quarter";

prt.appendChild(sln);
prt.appendChild(name);
prt.appendChild(branch);
prt.appendChild(regdc);
prt.appendChild(br);

sln.innerHTML=m; 
var input=document.createElement("input");
input.type="text";
input.name="name";
input.placeholder="Enter name"
input.className="w3-input w3-small w3-white w3-round-xxlarge";
name.appendChild(input);

var brch=document.createElement("select");
brch.name="branch"+m;
brch.className="w3-input w3-small w3-white w3-round-xxlarge";
branch.appendChild(brch);

for(var i=0; i<jsArr.length; i++)
{
   var opt = document.createElement("option");
   opt.text=jsArr[i];
   opt.value=jsArr[i];
   brch.appendChild(opt);
}

var reg=document.createElement("input");
reg.type="text";
reg.name="regdno"+m;
reg.id="regdno"+m;
reg.placeholder="Enter Regd.no";
reg.onblur=function() {chkRegd()};
reg.onkeyup=function() {bodyLoad()};
reg.className="w3-input w3-small w3-white w3-round-xxlarge";
regdc.appendChild(reg);
}
else
	{
	document.getElementById("rgd").innerHTML="Maximum 10 members can be added at a time...";
	}}
function chkRegd()
{
	regd=document.getElementById("regdno"+m).value;
	rv=regd.toUpperCase();
	c=rv.charAt(0);
	ch=rv.substr(0, 2);
	rd=parseInt(ch);
	year=new Date().getFullYear().toString().substr(-2);
	yrp=parseInt(year);
	yr=yrp-4;
	document.getElementById("rgd");
	if(rv.length==10)
		{
		rgd.innerHTML="";
		if(!(rd>=yr && rd<=yrp) && (c !== "T"))
			{
			document.getElementById("regdno"+m).value="";
			rgd.innerHTML="please input a valid registration no";
			document.getElementById("sub").setAttribute("disabled", true);
			}
		else
			{
			document.getElementById("sub").removeAttribute('disabled');
			}
		}
	else
	{
		document.getElementById("regdno"+m).value='';
	rgd.innerHTML="please input a valid registration no";
	}
	}
function bodyLoad()
{document.getElementById("sub").setAttribute("disabled", true);
rgd.innerHTML="";
}
	
</script>    
      
<body background="Images/4.jpg" onload="getBranch()"> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
%>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>

<!-- Page Container -->
<div class="w3-container w3-content w3-padding-64 w3-center" style="max-width:800px">
<br>
<form action="#"method="get">
<h3 class="w3-blue w3-round-xxlarge w3-center">ADD NEW MEMBER</h3>
<div id="cnsl">
<div class="w3-col w3-round-xxlarge" id="console">
 <span class="w3-white w3-round-xxlarge w3-small quarter">Sl.no</span>
<span class="w3-white w3-round-xxlarge w3-small quarter">Name</span>
<span class="w3-white w3-round-xxlarge w3-small quarter">Branch</span>
<span class="w3-white w3-round-xxlarge w3-small quarter">Regd.no</span>
</div>
<br>
<div class="w3-col w3-round-xxlarge" id="console">
<span class="w3-white w3-round-xxlarge w3-padding-small quarter" id="slno"></span>
 <span class="quarter"><input type="text" name="name1" id="name1" class="w3-input w3-small w3-white w3-round-xxlarge" required="" placeholder="Enter Name"/></span>
<span class="quarter"><select class=" w3-small w3-select w3-white w3-center w3-round-xxlarge" name="branch1" id="branch1" required=""><option value="-1">Choose branch</option></select></span>
<span class="quarter"><input type="text" name="regdno1" id="regdno1" onblur="chkRegd()" onkeyup="bodyLoad()" class="w3-input w3-small w3-white w3-round-xxlarge" required="" placeholder="Enter Regd.no"/></span>
<!-- <span class="w3-white w3-round-xxlarge w3-padding-small quarter"><input type="checkbox" name="ltr1" id="lateral" value="1"/></span> -->
</div>
<br>
</div>
<div class="w3-center w3-text-red">
		<span id="rgd"></span>
</div>
<br>
<div>
<input type="submit" value="Add" id="sub" class="w3-button w3-blue w3-center w3-small w3-round-xxlarge" style="border:2px solid #ccc!important"/>
 <button class="w3-button w3-blue w3-center w3-small w3-round-xxlarge" onclick="oneMore()" id="add" style="border:2px solid #ccc!important"><i class="fa fa-plus"></i></button>
  </div></form>
  <!-- End Page Container -->
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
    