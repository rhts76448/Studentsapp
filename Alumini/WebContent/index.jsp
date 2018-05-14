<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>REC Online Alumni</title>
</head>
<body>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
<%@include file="jsp/Nav.jsp" %>
<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px">
<br>
<%
String msg=(String)session.getAttribute("msg");
session.removeAttribute("msg");
if(msg!=null)
{%>
<p class="w3-text-red"><%=msg %></p>
<br>
<%}%>
<div class="w3-col w3-container w3-content  w3-row-padding w3-round-medium">
<div class="w3-card w3-half w3-container" style="height:200px">
<p class="w3-left w3-cyan w3-text-white w3-card-2 w3-round-medium">Principal's voice</p>
<div>
<div class="w3-content w3-container" style="text-align:justify;">
My association with the Department of Statistics, Utkal University started fifty six years ago and continues till today when I am completing 78 years of age. For about a decade, the Department did get a good number of students who got good placements in ISS, bank jobs an
</div>

</div>
</div>

<div class="w3-card w3-half w3-container" style="height:200px">
<p class="w3-left w3-cyan w3-text-white w3-card-2 w3-round-medium">NEWS Feed</p>
<div>
<div class="w3-content w3-container" style="text-align:justify;"> 

</div>
</div>
</div>
</div>

</div>
</div>
</body>
</html>