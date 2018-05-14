<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
 <!DOCTYPE html>
<html>
<title>Student's aPP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/profile.js"></script>

<style>
a{text-decoration:none;}
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<script>
function bodyLoad()
{
	document.getElementById("u_password").style.display='none';
	document.getElementById("password").style.display='block';
	document.getElementById("u_mail").style.display='none';
	document.getElementById("mail").style.display='block';
}
</script>
 <%
          String msg=(String)session.getAttribute("msg");
          session.removeAttribute("msg");
          String email=DataIn.getAdminMail();
          %>
<body onload="bodyLoad()"> 
<!-- Navbar -->
<%@ include file="AdminNav.jsp" %>
<div class="w3-content" style="max-width:800px;margin-top:46px">
 <div class="w3-row-padding">
    <img src="Images/app.jpg" class="w3-image"/>
    <hr>
     <div id="mail">
          <span class="w3-right w3-text-dark-blue"><a href="javascript:update_mail()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=email %></p>
          </div>
          <div id="u_mail">
          <form action="./UpdateMail" method="post">
          <p class="w3-text-dark-blue"><input type="email" name="email" id="email" placeholder="Enter your email address" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="Cancle" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="umail" id="umail" value="Save" class="w3-button w3-half w3-blue"/></p>
          </form></div>
    <div id="password">
          <p class="w3-text-dark-blue"><a href="javascript:change_pass()"><i class="fa fa-lock fa-fw w3-margin-right w3-large w3-text-teal"></i>Change password</a></p>
         <%
          if(msg!=null)
          {
          %>
          <p class="w3-text-red"><%=msg %></p>
          <%} %>
          </div>
          <div id="u_password">
           <form action="./UpdatePassword" method="post">
          <p class="w3-text-dark-blue"><input type="password" name="current" id="current" placeholder="Enter your current password" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="password" name="password1" id="password1" placeholder="Enter your new password(7 to 20)" onkeyup="chkPass()" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="password" name="password2" id="password2" placeholder="Re-enter your new password" onblur="cnfPass()" required="" class="w3-input w3-small"/></p>
          <div class="w3-center">
				<font color="red">
				<span id="cnf"></span>
				</font>
				</div>
           <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="Cancle" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="ucontact" id="ucontact" value="Save" class="w3-button w3-half w3-blue"/></p>
          </form>
          </div>
     </div>
<!-- End Page Content -->
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
 