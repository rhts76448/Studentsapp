<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
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
   <script>
function bodyLoad()
{
document.getElementById("u_add").style.display='none';
document.getElementById("u_mail").style.display='none';
document.getElementById("u_contact").style.display='none';
document.getElementById("u_password").style.display='none';
document.getElementById("cnf_deactive").style.display='none';
document.getElementById("u_pic").style.display='none';

document.getElementById("add").style.display='block';
document.getElementById("mail").style.display='block';
document.getElementById("contact").style.display='block';
document.getElementById("password").style.display='block';
document.getElementById("deactive").style.display='block';

document.getElementById("u_exp").style.display='none';
document.getElementById("u_qua").style.display='none';
document.getElementById("exp").style.display='block';
document.getElementById("qua").style.display='block';

}
</script>    
      
<body onload="bodyLoad()"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<%
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
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
<%@ include file="Fnav.jsp" %>

<!-- Page Container -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-text-blue w3-card-4">
      <%@ include file="profileHead.jsp" %>
      <hr>    
     <div class="w3-container">
<p class="w3-large w3-text-teal"><b><i class="fa fa-certificate fa-fw w3-margin-right w3-text-teal"></i>Qualification and Experience</b></p>
			 <p><b><i class="fa fa-calendar fa-fw w3-margin-right"></i>Year of Experience</b></p>
			 <div id="exp">
			 <%
			 if(ob.getExp_y()==null)
			 {
			 %>
			 <p class="w3-text-dark-blue"><a href="javascript:update_exp()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please update your experience details</a></p>
			 <%
			 }else
			 {
			 %>
			 <span class="w3-right w3-text-dark-blue"><a href="javascript:update_exp()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=ob.getExp_y()%> year(s)</p>  
			<%} %>
			   </div>
			   <div id="u_exp">
          <form action="./UpdateExp" method="post">
          <p class="w3-text-dark-blue"><input type="text" name="experience" id="experience" placeholder="Enter your year of experience" required="" class="w3-input"/></p>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="uexp" id="uexp" value="Save" class="w3-button w3-half w3-blue"/></p>
         
          </form></div>
			 <p><b><i class="fa fa-certificate fa-fw w3-margin-right"></i>Highest/Latest Qualification</b></p>
			  <div id="qua">
			  <%
			 if(ob.getQualification()==null)
			 {
			 %>
			 <p class="w3-text-dark-blue"><a href="javascript:update_qua()" Style>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please update your educational details</a></p>
			 <%
			 }else
			 {
			 %>
			 <span class="w3-right w3-text-dark-blue"><a href="javascript:update_qua()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
			 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=ob.getQualification()%></p> 
			 <%} %>
      		</div>
      		<div id="u_qua">
          <form action="./UpdateQualification" method="post">
          <p class="w3-text-dark-blue"><input type="text" name="qualification" id="qualification" placeholder="Enter your highest/latest qualification" required="" class="w3-input"/></p>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="uqua" id="uqua" value="Save" class="w3-button w3-half w3-blue"/></p>
         
          </form></div></div>
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
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
    