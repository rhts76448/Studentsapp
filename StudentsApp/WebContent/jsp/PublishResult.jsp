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
.btn{width:32%;float:center;}
</style>
<%@ include file="subjects.jsp" %>
<%@ include file="Loader.jsp"%>
<%
 	List<String[]> rl = new ArrayList<String[]>();
 	for(int i=0;i<brch1.length;i++)
 	{
 		rl.add(DataIn.getUnPublishedResult(brch1[i]));
 	}
 	String[][] rls= new String[rl.size()][];
 	rl.toArray(rls);
 	%>
<script type="text/javascript">
var rslt=new Array();
<%
for (int i=0; i < rls.length; i++)
{
%> rslt[<%=i%>] = new Array();
<%
	for(int j=0;j<rls[i].length;j++)
		{%>
	rslt[<%= i %>][<%=j%>] = '<%=rls[i][j] %>';
<%}}%>

function getUnPublished(j)
{
	console=document.getElementById("console"+j);
	console.innerHTML="";
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    } else { 
        console.className = console.className.replace(" w3-show", "");
    }
	branch=document.getElementById("btn"+j).value;
	document.getElementById("brch").value=branch;
	for(var i=0;i<rslt[j].length;i++)
	{
	var prg=document.createElement("p");
	prg.className="w3-button w3-center w3-white w3-text-blue w3-round-xlarge";
	console.appendChild(prg);
	var opt = document.createElement("input");
	opt.type="submit";
	opt.name="sem_yr";
	opt.className="w3-button w3-center w3-white w3-text-blue w3-round-xlarge";
	opt.value=rslt[j][i]
    prg .appendChild(opt);
	}
	
}
function getHide()
{
	document.getElementById("updateMarks").style.display='none';
	document.getElementById("publishResult").style.display='none';
}
function unHideUpdate()
{
	bodyLoad();
	document.getElementById("updateMarks").style.display='block';
	document.getElementById("publishResult").style.display='none';
}
function unHideResult()
{
	document.getElementById("updateMarks").style.display='none';
	document.getElementById("publishResult").style.display='block';
}
function show()
{
view=document.getElementById("view");
view1=document.getElementById("view1");
view.className += " w3-show";
view1.className = view1.className.replace(" w3-show", "");
}
</script>
<body onload="getHide()"> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
String flag=(String)session.getAttribute("flag");
session.removeAttribute("flag");
%>
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>

<!-- Page Container -->
<div class="w3-container w3-card-2 w3-content w3-padding-64 w3-center w3-show w3-hide" id="view1" style="max-width:800px">
<br>
<%if(flag!=null) {%>
<div class="w3-center w3-text-red"><%=flag %></div>
<%} %>

<h3 class="w3-blue w3-round-xxlarge w3-center">Result</h3>
<br>
<div class="w3-center">
<input type="button" value="Publish" onclick="unHideResult()" class="w3-button btn w3-blue w3-round-xxlarge"/>
<input type="button" value="View" onclick="show()" class="w3-button btn w3-blue w3-round-xxlarge"/>
<input type="button" value="Update Marks" onclick="unHideUpdate()" class="w3-button btn w3-blue w3-round-xxlarge"/>
</div>
<br> 
<div id="updateMarks" class="w3-center">
<form action="./getStudents"method="post">
<h3 class="w3-center w3-blue w3-round-xxlarge">Branch</h3>
<div class="w3-blue w3-round-xxlarge w3-center"><select class="w3-select w3-center w3-round-xxlarge w3-white w3-center" name="branch" id="branch" onchange="getSubject()" required=""><option value="-1">Choose branch</option></select></div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Semester</h3>
<div class="w3-blue w3-round-xxlarge w3-center">
<select name="semester" id="semester" class="w3-select w3-round-xxlarge w3-center w3-white" required="" onchange="getSubject()">
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
<h3 class="w3-center w3-blue w3-round-xxlarge">Subject</h3>
<div class="w3-blue w3-round-xxlarge w3-center"><select id="subject" name="subject" class="w3-center w3-select w3-round-xxlarge w3-white" required=""><option value="-1">choose subject</option></select></div>
<h4 class="w3-center"><input type="submit" class="w3-button w3-blue w3-round-xxlarge" value="Get Students List"/></h4>
</form>
</div>

<div id="publishResult"> 
<form action="./PublishResult"method="post">
<br>
<p class="w3-text-red w3-center">Note*:- Here only show the list of unpublished result(i.e. marks are already submitted and result has not published yet).</p>
<%for(int i=0;i<brch1.length;i++){%>
<p class="w3-input w3-small w3-blue w3-round-xxlarge"><input type="button" class="w3-button w3-blue w3-round-xxlarge" id="btn<%=i %>" onclick="getUnPublished(<%=i%>)" value="<%=brch1[i] %>"></p>
<div id="console<%=i %>" class="w3-center"></div>
<%} %>
<input type="hidden" id="brch" name="branch">
</form>
</div>
</div>
<%@include file="AResult.jsp" %>
<%@include file="Footer.jsp" %>
</body>
</html>