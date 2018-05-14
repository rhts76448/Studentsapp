<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="com.students.bean.ResultBean"%>
      <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 	 <%@page import="com.students.core.Checker"%>
 	<%
String[] ob=DataIn.getSemYr();
%>
    <style>
.quarter{width:25%;float:left;}
.btn{width:38%;float:center;}
</style>
 <!DOCTYPE html>
<html>
<title>Student's aPP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script type="text/javascript">
function getResult(j)
{
	console=document.getElementById("console"+j);
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    } else { 
        console.className = console.className.replace(" w3-show", "");
    }
}
function unHideInter()
{
	console=document.getElementById("internalConsole");
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    } else { 
        console.className = console.className.replace(" w3-show", "");
    }
}
</script>
<body>
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%@ include file="Fnav.jsp" %>

<!-- Page Container -->
<div class="w3-container w3-card-2 w3-content w3-padding-64 w3-center w3-show w3-hide" style="max-width:800px" id="view">
<br>
<h3 class="w3-blue w3-round-xxlarge w3-center">Result</h3>
<br>
<div class="w3-center w3-col">
<input type="button" value="Semester" onclick="getSemResult()" class="w3-button w3-blue btn w3-round-xxlarge">
<input type="button" value="Internal" onclick="unHideInter()" class="w3-button w3-blue btn w3-round-xxlarge">
</div>
<div class="w3-center w3-col w3-hide" id="internalConsole">
<form action="./Result" method="post">
<%for(int i=0;i<ob.length;i++) {%>
<p class="w3-half"><input type="submit" value="<%=ob[i] %>" name="semYr" class="w3-button w3-blue w3-round-xxlarge"></p>
<%} %>
</form>
</div>
</div>
<%@include file="SemResults.jsp" %>
<%@include file="Footer.jsp" %>
</body>
</html>