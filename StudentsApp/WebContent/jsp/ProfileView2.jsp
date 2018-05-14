<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
    <%@page import="com.students.core.Checker"%>
     <%@page import="com.students.bean.Profile"%>
     <%@page import="com.students.bean.FeedbackBean"%>
 <!DOCTYPE html>
<html>
<title>Student's aPP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut icon" href="Images/favicon.ico">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/valid.js"></script>
<script src="js/profile.js"></script>


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
        </style> 
      
<body> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("prgd");
String regd=(String)session.getAttribute("regd");
String flagq=(String)session.getAttribute("flagq");
session.removeAttribute("prgd");
session.removeAttribute("flagq");
Profile ob=DataIn.getFdetails(reg);
Profile ob1=DataIn.getAddress(reg);
int r=DataIn.getRatting(reg);
int s=1;
if(r!=0)
	s=r;
int r1=DataIn.getRatting(reg,1);
int r2=DataIn.getRatting(reg,2);
int r3=DataIn.getRatting(reg,3);
int r4=DataIn.getRatting(reg,4);
int r5=DataIn.getRatting(reg,5);
int p1=(r1*100)/s;
int p2=(r2*100)/s;
int p3=(r3*100)/s;
int p4=(r4*100)/s;
int p5=(r5*100)/s;
%>
<!-- Navbar -->
<%if(Checker.isAdmin(user)){%>
<%@ include file="AdminNav.jsp" %>
<%}else if(Checker.regdChk(regd)){ %>
<%@ include file="Fnav.jsp" %>
<%}else{ %>
<%@ include file="Nav.jsp" %>
<%} %>
<!-- Page Container -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Grid -->
  <div class="w3-row-padding">
  <%
  if(flagq!=null)
  {
  %>
  <h3 class="w3-center w3-text-red"><%=flagq %></h3>
  <%}else
	  {%>
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
          <p><i class="fa fa-calendar fa-fw w3-margin-right w3-text-teal"></i><%=ob.getDob() %></p>
          <div id="add">
          <%
          if(ob1.getCity()!=null)
          {%>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob1.getCity() %>, <%=ob1.getState() %></p>
          <%}%>
          <div id="mail">
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getEmail() %></p>
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
      <hr>    
     <div>
<p class="w3-large w3-text-teal"><b><i class="fa fa-certificate fa-fw w3-margin-right w3-text-teal"></i>Qualification and Experience</b></p>
			<% if(ob.getExp_y()!=null)
			 {
			 %>
			 <p><b><i class="fa fa-calendar fa-fw w3-margin-right"></i>Year of Experience</b></p>
			 <div id="exp">
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=ob.getExp_y()%> year(s)</p>  
			   </div>
            <%}
			 if(ob.getQualification()!=null)
			 {
			 %>
			 <p><b><i class="fa fa-certificate fa-fw w3-margin-right"></i>Highest/Latest Qualification</b></p>
			  <div id="qua">
			 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ob.getQualification()%></p> 
      		</div>
      		 <%} %>
      <hr>
	<div class="w3-container">
      <p class="w3-large w3-text-teal"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Feedbacks about U</b></p>
          <p><b>Excelent</b></p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:<%=p5%>%"><%=r5 %>/<%=r %></div>
          </div>
          <p><b>Very Good</b></p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:<%=p4%>%">
              <div class="w3-center w3-text-white"><%=r4 %>/<%=r %></div>
            </div>
          </div>
          <p><b>Good</b></p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:<%=p3%>%"><%=r3 %>/<%=r %></div>
          </div>
          <p><b>Bad</b></p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:<%=p2%>%"><%=r2 %>/<%=r %></div>
          </div>
		  <p><b>Very Bad</b></p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:<%=p1%>%"><%=r1 %>/<%=r %></div>
          </div>
		</div>
		</div>
    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card-2   w3-text-white w3-margin-bottom">
         <p class="w3-large w3-text-teal"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Comments</b></p>
        <div class="w3-container">
        <%
   
        FeedbackBean[] ob2=DataIn.getFeedback(reg);
        if(ob2.length<=0)
        {%>
         <h5 class="w3-opacity w3-center"><b>No feedbacks</h5>
         <%
        }
        else
        {
        for(int i=0;i<ob2.length;i++)
        {
        %>
          <p class="w3-opacity w3-text-deep-purple"><i class="fa fa-circle fa-fw w3-margin-right"></i><b><%=ob2[i].getSubject() %></b></p>
         
          <p class="w3-text-blue"><%=ob2[i].getFeed() %></p>
          <%}} %>
        </div>
       
      </div>

     
      </div>

    <!-- End Right Column -->
    </div>
<%} %>
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
     