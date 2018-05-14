<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
     <%@page import="com.students.dbconn.DataIn"%>
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
<script>
<%
String red=(String)session.getAttribute("regd");
Profile ob=DataIn.getSdetails(red);
String br=ob.getBranch();
int sm=ob.getSem();
Profile fclty[]=DataIn.getFaculty(sm,br);
String[] sub=DataIn.getSubject(br,sm);
%>

var jsArr = new Array();
var jsArrr = new Array();
var jsAr = new Array();
<%
for (int j=0; j <fclty.length; j++)
{
%>
jsArr[<%= j %>] = '<%=fclty[j].getName() %>';
<%}
for (int j=0; j <fclty.length; j++)
{
%>
jsAr[<%= j %>] = '<%=fclty[j].getRegdno() %>';
<%}%>
<%
for (int j=0; j < sub.length; j++)
{
%>
jsArrr[<%= j %>] = '<%=sub[j] %>';
<%}%>
function bodyload()
{
  subject = document.getElementById("sub");
  faculty = document.getElementById
  ("faculty");
  flag=document.getElementById("flag").value;
  console=document.getElementById("status");
  if(flag!=null)
	  console.innerHTML=flag;
  for(var i=0; i<jsArr.length; i++)
  {
     var opt = document.createElement("option");
     opt.text=jsArr[i];
     opt.value=jsAr[i];
     faculty.appendChild(opt);
  }
  for(var i=0; i<jsArrr.length; i++)
  {
     var opt = document.createElement("option");
     opt.text=jsArrr[i];
     opt.value=jsArrr[i];
     subject.appendChild(opt);
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
<%@ include file="Nav.jsp" %>

 <form action="./Feedback">
 <input type=hidden name="flag" id="flag"/>
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center" id="status"></div>
<h2 class="w3-wide w3-center">Feedback Hub</h2>
 <div class="w3-blue w3-round-xxlarge" align="center">
     <h3>Faculty</h3> 
 </div>
 <div align="center">`
  <select id="faculty" name="faculty" class="w3-select w3-round-xxlarge w3-white">      </select>
      </div>
 
 <div class="w3-blue w3-round-xxlarge" align="center">
     <h3>Subject</h3> 
 </div>
  <div align="center">      
     <select id="sub" name="sub" class="w3-select w3-round-xxlarge w3-white">      </select>
   </div>
 
 <div class="w3-blue w3-round-xxlarge" align="center">
     <h3>Grade</h3> 
 </div>
 <font color="blue">
   <div align="center">
   <table> 
   <tr>
   <td><input type="radio" name="grade" value="5" required></td><td>Excellent</td>
   </tr>
    <tr>
   <td><input type="radio" name="grade" value="4"></td><td>Very good</td>
   </tr>
    <tr>
   <td><input type="radio" name="grade" value="3"></td><td>Good</td>
   </tr>
    <tr>
   <td><input type="radio" name="grade" value="2"></td><td>Bad</td>
   </tr>
    <tr>
   <td><input type="radio" name="grade" value="1"></td><td>Very Bad</td>
   </tr>
	</table>
</div>
</font>
 <div class="w3-blue w3-round-xxlarge"  align="center">
     <h3>Comment</h3> 
 </div>
  <div align="center">
  <textarea name="comment" id="comment" cols="35" rows="5">
  </textarea></div>

 <div align="center" >
   <input type="submit" value="Submit" class="w3-button w3-round-xxlarge w3-blue">
   </div>
 </div>
</form>
      
<%@ include file="Footer.jsp" %>
</body>
</html>