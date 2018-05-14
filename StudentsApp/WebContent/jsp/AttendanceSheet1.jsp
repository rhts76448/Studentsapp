<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 	 
     <%@page import="com.students.bean.Profile"%>
 <!DOCTYPE html>
<html>
<head>
<title>Student's aPP : Attendance Sheet</title>
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
<%@ include file="subjects.jsp" %>
<%@ include file="Loader.jsp" %>
</head>
<body onload="bodyLoad()"> 
<noscript>
<style type="text/css">
.login-wrap{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%@ include file="Fnav.jsp" %>
<%@ include file="Selector.jsp" %>
<%
String dec=(String)session.getAttribute("dec");
session.removeAttribute("dec");
String view=(String)session.getAttribute("view");
session.removeAttribute("view");
if(view==null)
{
if(dec.equals("take"))
{
%>
<%@ include file="Sheet.jsp" %>
<%
}
else if(dec.equals("generate OTC"))
{%>
<%@ include file="AttdtOTP.jsp"%>
<%
}
else if(dec.equals("view"))
{%>
<%@ include file="SheetView.jsp"%>
<%}
}
else if(view.equals("view"))
{%>
<%@ include file="SheetView1.jsp" %>
<%}%>
<%@ include file="Footer.jsp" %>
</body>
</html>