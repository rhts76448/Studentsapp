<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <%@page import="com.students.bean.FeedbackBean"%>
      <%@page import="com.students.bean.AttendenceBean"%>
     <%@page import="com.students.core.Checker"%>
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
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<style>a{text-decoration:none;}</style>
 <style>
            .round {
                border-radius: 50%;
                overflow: hidden;
                width: 200px;
                height: 200px;
            }
            .round img {
                display: block;
                margin-top:20px;
            /* Stretch 
                  height: 100%;
                  width: 100%; */
            min-width: 100%;
            min-height: 100%;
            }
          .w3-bio-input{padding:8px;border:none;border-bottom:1px solid #ccc;width:100%}
        </style>
<body> 
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("q");
String regd=(String)session.getAttribute("regd");
session.removeAttribute("q");
Profile ob=DataIn.getSdetails(reg);
Profile ob1=DataIn.getAddress(reg);
String[] sm=DataIn.getAttSem(reg);
List<AttendenceBean[]> l = new ArrayList<AttendenceBean[]>();
for(int i=0;i<sm.length;i++)
{
	l.add(DataIn.getAttendance(reg, sm[i]));
}
AttendenceBean[][] s= new AttendenceBean[l.size()][];
l.toArray(s);
%>
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<!-- Navbar -->
<%if(Checker.isAdmin(user)){%>
<%@ include file="AdminNav.jsp" %>
<%}else{ %>
<%@ include file="Fnav.jsp" %>
<%} %>
<!-- Page Container -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Grid -->
  <div class="w3-row-padding">
  <%if(ob.getName()!=null)
{ %>
    <!-- Left Column -->
    
    <div class="w3-third">
      <div class="w3-text-blue w3-card-4">
      <div class="w3-center">
      <br>
            <img src='./RetrivePic?imageId=<%=ob.getRegdno() %>' class="round" onError="this.onerror=null;this.src='Images/favtar.png';" alt="<%=ob.getName()%>"/>
        </div>
        <div class="w3-display-container w3-container w3-text-black">
          

            <h2><%=ob.getName() %></h2>
         
        </div>
        <div class="w3-container">
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getBranch() %></p>
          <p class="w3-large"><i class="fa fa-star fa-fw w3-margin-right w3-large w3-text-teal"></i><%=reg %></p>
          <p><i class="fa fa-calendar fa-fw w3-margin-right w3-text-teal"></i><%=ob.getDob() %></p>
          <div id="add">
          <%
          if(ob1.getCity()!=null)
          {
        	%>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob1.getCity() %>, <%=ob1.getState() %></p>
          <%} %>
          </div>
          <div id="mail">
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getEmail() %></p>
          </div>
          <div id="contact">
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getPhoneNo() %></p>
           </div>
            <%
          if(Checker.isAdmin(user))
          {
          %>
          <div>
       		<form action="./RemoveUser" method="post">
       		<input type="hidden" value="<%=ob.getRegdno() %>" name="prfregd"/>
          <p class="w3-center"><input type="submit" value="Remove" class="w3-center w3-button w3-red w3-round-xxlarge w3-small"/></p>
          </form>
          </div>
          <%} %>
</div>
    <br>
    </div>
    <!-- End Left Column -->
</div>
 <!-- Middle Column -->
 
  <div class="w3-third">
 <%@ include file="AttendenceView.jsp" %>
  <!-- End Middle Column -->
	</div>

	 <!-- Right Column -->
	
  <div class="w3-third">
  <div class="w3-container w3-card-2   w3-text-white w3-margin-bottom">
     <p class="w3-large w3-text-teal w3-center w3-card-4"><b>Bio-data form</b></p>
    <div>
    <br> 
   <div class="w3-card-2">
   <div class="w3-container">
  <p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Personal details</b></p>

<%if(ob.getName()!=null) {%>
   	<span class="w3-text-blue w3-half">Name:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getName() %></p>
<%}if(ob.getGender()!=null) { %>
	<span class="w3-text-blue w3-half">Gender:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getGender() %></p>
<%}if(ob.getDob()!=null) { %>
	<span class="w3-text-blue w3-half">Date of birth:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getDob() %></p>
<%}if(ob.getEmail()!=null) { %>
	<span class="w3-text-blue w3-half">Email Address:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getEmail() %></p>
<%}if(ob.getPhoneNo()!=null) { %>
	<span class="w3-text-blue w3-half">Contact no:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getPhoneNo() %></p>
<%}if(ob.getAlCon()!=null) { %>
	<span class="w3-text-blue w3-half">Alternative no:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getAlCon() %></p>
<%}if(ob.getFthName()!=null) { %>
	<span class="w3-text-blue w3-half">Father's name:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getFthName() %></p>
<%}if(ob.getfContact()!=null) { %>		  
	<span class="w3-text-blue w3-half">Father's Contact no:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getfContact() %></p>
<%}if(ob.getMthName()!=null) { %>		  
	<span class="w3-text-blue w3-half">Mother's name:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getMthName() %></p>
<%}if(ob.getmContact()!=null) { %>		  
	<span class="w3-text-blue w3-half">Mother's Contact no:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getmContact() %></p>
<%} if(ob1.getAddress()!=null) { %>
<p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Address Details</b></p>

	<span class="w3-text-blue w3-half">Address:</span>
		  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob1.getAddress() %></p>
<%}if(ob1.getCity()!=null) { %>		 
	<span class="w3-text-blue w3-half">City:</span>
          <p class="w3-text-blue w3-half w3-white w3-input"><%=ob1.getCity() %></p>
<%}if(ob1.getDistrict()!=null) { %>          
    <span class="w3-text-blue w3-half">District:</span>
          <p class="w3-text-blue w3-half w3-white w3-input"><%=ob1.getDistrict() %></p>
<%}if(ob1.getState()!=null) { %>         
     <span class="w3-text-blue w3-half">State:</span>
          <p class="w3-text-blue w3-half w3-white w3-input"><%=ob1.getState() %></p>
<%}if(ob1.getPin()!=null) { %>          
     <span class="w3-text-blue w3-half">PIN:</span>
          <p class="w3-text-blue w3-half w3-white w3-input"><%=ob1.getPin() %></p>
<%} if(ob1.getsName()!=null) { %>
    <p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Educational Details</b></p>
  		<p class="w3-large w3-text-teal"><b>10th Details:</b></p>
  	<span class="w3-text-blue w3-half">School/Board Name:</span>
  			  <p class="w3-text-blue w3-half w3-white w3-input"><%=ob.getsName() %></p>
  	<span class="w3-text-blue w3-half">Marks:(in percentage)</span>
  			  <p class="w3-text-dark-blue w3-half w3-white w3-input"><%=ob.getsMarks() %>&nbsp;(%)</p>
  	<span class="w3-text-blue w3-half">Pass Out year:</span>
  			  <p class="w3-text-blue w3-half  w3-white w3-input"><%=ob.getsPass() %></p>
  		<p class="w3-large w3-text-teal"><b>12th/Diploma Details:</b></p>
  	<span class="w3-text-blue w3-half">College/Board Name:</span>
  			  <p class="w3-text-blue w3-half  w3-white w3-input"><%=ob.getcName() %></p>
  	<span class="w3-text-blue w3-half">Marks:(in percentage)</span>
  			  <p class="w3-text-dark-blue w3-half w3-white w3-input"><%=ob.getcMarks() %>&nbsp;(%)</p>
  	<span class="w3-text-blue w3-half">Pass Out year:</span>
  			  <p class="w3-text-blue w3-half  w3-white w3-input"><%=ob.getcPass() %></p>
<%} %>
   </div>
   <br>
 </div>
 <br> 
    </div>
   
  </div>

  <!-- End Right Column -->
	</div>
	 <%}
else{
%>
<br>
<h3 class="w3-text-red w3-center">No data found</h3>
<br> 
<%} %>
   <!-- End Grid -->
   </div>
  
  <!-- End Page Container -->
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
    