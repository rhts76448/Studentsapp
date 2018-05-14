<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="com.students.bean.ResultBean"%>
      <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 	 <%@page import="com.students.core.Checker"%>

 <%
 String semYr=(String)session.getAttribute("semYr");
 String regd=(String)session.getAttribute("regd");
ResultBean[] r1=DataIn.getSemResult(semYr);
ResultBean[] r2=DataIn.getResult(semYr);
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
var cns=null;
function showRegdno(i)
{
	if(cns!=null && cns!=i)
		{
		document.getElementById(cns).className = console.className.replace(" w3-show", "");
		}
	cns=i;
	console=document.getElementById(i);
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    }
}
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
<body>
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%if(Checker.isAdmin(regd)){%>
<%@ include file="AdminNav.jsp" %>
<%}else{ %>
<%@ include file="Fnav.jsp" %>
<%} %>
<!-- Page Container -->
<div class="w3-container w3-card-2 w3-content w3-padding-64 w3-center" style="max-width:800px">
<br>
<h3 class="w3-blue w3-round-xxlarge w3-center">Result</h3>
<br>
<div class="w3-center">
<select onchange="showRegdno(this.value)" class="w3-white w3-button w3-round-xxlarge">
<option value="-1">Choose a branch...</option>
<%
String branch1="s";
for(int i=0;i<r1.length;i++) {
if(Checker.notEquals(branch1, r1[i].getBranch())){
	branch1=r1[i].getBranch();%>
	<option value="<%=r1[i].getBranch() %>"><%=r1[i].getBranch() %></option>
	<%}} %>
</select>
</div>
<div class="w3-center w3-col">
<%
String branch="s";
for(int i=0;i<r1.length;i++) {
if(Checker.notEquals(branch, r1[i].getBranch())){
	branch=r1[i].getBranch();
%>
<div id="<%=r1[i].getBranch() %>" class="w3-center w3-hide">
<%for(int j=0;j<r1.length;j++) {
if(r1[i].getBranch().equals(r1[j].getBranch())){
%>
<p class="w3-center"><input type="button" value="<%=r1[j].getRegdno() %> <%=r1[j].getMark() %>/<%=r1[j].getT_mark() %>" onclick="getResult(<%=r1[j].getRegdno() %>)"class="w3-button w3-blue"></p>
<div id="<%=r1[j].getRegdno() %>" class="w3-hide w3-center">
<%
for(int k=0;k<r2.length;k++){
	if(r1[j].getRegdno().equals(r2[k].getRegdno())){
%>
<p class="w3-white w3-text-blue w3-input"><%=r2[k].getSubject() %>  <%=r2[k].getMark() %>/<%=r2[k].getT_mark() %></p>
<%}} %>
</div>
<%}} %>

</div>
<%}} %>
</div>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>