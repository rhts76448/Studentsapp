<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <%@page import="com.students.bean.FeedbackBean"%>
      <%@page import="com.students.bean.AttendenceBean"%>
     <%@page import="com.students.core.Checker"%>
     <%@page import="java.util.ArrayList" %>
 	<%@page import="java.util.List" %>
 	<style>
.half{width:50%;float:left;}
</style>
<%
String blk="";
String user=(String)session.getAttribute("user");
String reg=(String)session.getAttribute("regd");
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

document.getElementById("bio_name").setAttribute("disabled", true);
document.getElementById("bio_gender").setAttribute("disabled", true);
document.getElementById("bio_gender1").setAttribute("disabled", true);
document.getElementById("bio_dob").setAttribute("disabled", true);
document.getElementById("bio_email").setAttribute("disabled", true);
document.getElementById("bio_con").setAttribute("disabled", true);
document.getElementById("bio_acon").setAttribute("disabled", true);
document.getElementById("bio_fname").setAttribute("disabled", true);
document.getElementById("bio_fcon").setAttribute("disabled", true);
document.getElementById("bio_mname").setAttribute("disabled", true);
document.getElementById("bio_mcon").setAttribute("disabled", true);
document.getElementById("bio_p").style.display='none';

document.getElementById("bio_name").value="<%=ob.getName() %>";
var x="<%=ob.getGender() %>";
if(x=="male")
	{document.getElementById("bio_gender").checked = true;}
else if(x=="female")
	{document.getElementById("bio_gender1").checked = true;}
	
document.getElementById("bio_dob").value="<%=ob.getDob() %>";
document.getElementById("bio_email").value="<%=ob.getEmail() %>";
document.getElementById("bio_con").value="<%=ob.getPhoneNo() %>";
document.getElementById("bio_acon").value="<%=(ob.getAlCon()!=null)?(ob.getAlCon()):(blk) %>";
document.getElementById("bio_fname").value="<%=(ob.getFthName()!=null)?(ob.getFthName()):(blk) %>";
document.getElementById("bio_fcon").value="<%=(ob.getfContact()!=null)?(ob.getfContact()):(blk) %>";
document.getElementById("bio_mname").value="<%=(ob.getMthName()!=null)?(ob.getMthName()):(blk) %>";
document.getElementById("bio_mcon").value="<%=(ob.getmContact()!=null)?(ob.getmContact()):(blk) %>";

document.getElementById("bio_address").setAttribute("disabled", true);
document.getElementById("bio_city").setAttribute("disabled", true);
document.getElementById("bio_district").setAttribute("disabled", true);
document.getElementById("bio_state").setAttribute("disabled", true);
document.getElementById("bio_pin").setAttribute("disabled", true);
document.getElementById("bio_a").style.display='none';

document.getElementById("bio_address").value="<%=(ob1.getAddress()!=null)?(ob1.getAddress()):(blk)%>";
document.getElementById("bio_city").value="<%=(ob1.getCity()!=null)?(ob1.getCity()):(blk)%>";
document.getElementById("bio_district").value="<%=(ob1.getDistrict()!=null)?(ob1.getDistrict()):(blk)%>";
document.getElementById("bio_state").value="<%=(ob1.getState()!=null)?(ob1.getState()):(blk)%>";
document.getElementById("bio_pin").value="<%=(ob1.getPin()!=null)?(ob1.getPin()):(blk)%>";

document.getElementById("bio_hsc").setAttribute("disabled", true);
document.getElementById("bio_hsc_marks").setAttribute("disabled", true);
document.getElementById("bio_hsc_pass").setAttribute("disabled", true);
document.getElementById("bio_inter").setAttribute("disabled", true);
document.getElementById("bio_inter_marks").setAttribute("disabled", true);
document.getElementById("bio_inter_pass").setAttribute("disabled", true);
document.getElementById("bio_e").style.display='none';

document.getElementById("bio_hsc").value="<%=(ob.getsName()!=null)?(ob.getsName()):(blk) %>";
document.getElementById("bio_hsc_marks").value="<%=(ob.getsMarks()!=null)?(ob.getsMarks()):(blk) %>";
document.getElementById("bio_hsc_pass").value="<%=(ob.getsPass()!=null)?(ob.getsPass()):(blk) %>";
document.getElementById("bio_inter").value="<%=(ob.getcName()!=null)?(ob.getcName()):(blk) %>";
document.getElementById("bio_inter_marks").value="<%=(ob.getcMarks()!=null)?(ob.getcMarks()):(blk) %>";
document.getElementById("bio_inter_pass").value="<%=(ob.getcPass()!=null)?(ob.getcPass()):(blk) %>";

document.getElementById("pcnf").innerHTML="";
document.getElementById("pcnf2").innerHTML="";
document.getElementById("pcnf3").innerHTML="";
document.getElementById("pcnf4").innerHTML="";
document.getElementById("pcnf5").innerHTML="";

document.getElementById("picnf").innerHTML="";
document.getElementById("picnf2").innerHTML="";
}
</script>
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
<body onload="bodyLoad()"> 
<noscript>
<style type="text/css">
.w3-content{display:none;}
</style>
<font color="red" size="20">Please Enable javaScript to Continue...</font>
</noscript>
<!-- Navbar -->
<%@ include file="Nav.jsp" %>

<!-- Page Container -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    
    <div class="w3-third">
      <div class="w3-text-blue w3-card-4">
    <%@ include file="profileHead.jsp" %>
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
   <p class="w3-right w3-text-dark-blue"><a href="javascript:bio_personal()">Edit<i class="fa fa-edit"></i></a></p>
<p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Personal details</b></p>
<form action="./UpdateBio1" method="post">
   	<span class="w3-text-blue w3-half">Name:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_name" id="bio_name" placeholder="Enter your Name" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">Gender:</span>
		  <p class="w3-text-blue w3-half"><input type="radio" name="bio_gender" id="bio_gender" value="male" required="" class="w3-radio w3-small"/>Male
		  <input type="radio" name="bio_gender" id="bio_gender1" required="" value="female" class="w3-radio w3-small"/>Female</p>
	<span class="w3-text-blue w3-half">Date of birth:</span>
		  <p class="w3-text-blue w3-half"><input type="date" name="bio_dob" id="bio_dob" placeholder="dd/mm/yyyy" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">Email Address:</span>
		  <p class="w3-text-blue w3-half"><input type="email" name="bio_email" id="bio_email" placeholder="Enter your Email addeess" value="" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">Contact no:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_con" onblur="chkPhone(this.value,pcnf2)" id="bio_con" placeholder="Enter your Conatact no" value="" required="" class="w3-bio-input w3-small"/></p>
	 <div class="w3-center">
				<font color="red">
				<span id="pcnf2"></span>
				</font>
				</div>
	<span class="w3-text-blue w3-half">Alternative no:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_acon" onblur="chkPhone(this.value,pcnf3)" id="bio_acon" placeholder="Enter your Alternative no" value="" required="" class="w3-bio-input w3-small"/></p>
	 <div class="w3-center">
				<font color="red">
				<span id="pcnf3"></span>
				</font>
				</div>
	<span class="w3-text-blue w3-half">Father's name:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_fname" id="bio_fname" placeholder="Enter your Father's name" value="" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">Father's Contact no:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_fcon" onblur="chkPhone(this.value,pcnf4)" id="bio_fcon" placeholder="Enter your Father's contact no" value="" required="" class="w3-bio-input w3-small"/></p>
	 <div class="w3-center">
				<font color="red">
				<span id="pcnf4"></span>
				</font>
				</div>
	<span class="w3-text-blue w3-half">Mother's name:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_mname" id="bio_mname" placeholder="Enter your Mother's name" value="" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">Mother's Contact no:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="bio_mcon" onblur="chkPhone(this.value,pcnf5)" id="bio_mcon" placeholder="Enter your Mother's contact no" value="" class="w3-bio-input w3-small"/></p>
 <div class="w3-center">
				<font color="red">
				<span id="pcnf5"></span>
				</font>
				</div>
<div id="bio_p">
		  <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="ucontact" id="ucontact" value="Save" class="w3-button w3-half w3-blue"/></p>
 </div> 
 </form>   
<p class="w3-right w3-text-dark-blue"><a href="javascript:bio_address()">Edit<i class="fa fa-edit"></i></a></p>
<p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Address Details</b></p>
<form action="./UpdateAddress" method="post">
	<span class="w3-text-blue w3-half">Address:</span>
		  <p class="w3-text-blue w3-half"><input type="text" name="address" id="bio_address" placeholder="Enter your address" required="" class="w3-bio-input w3-small"/></p>
	<span class="w3-text-blue w3-half">City:</span>
          <p class="w3-text-blue w3-half"><input type="text" name="city" id="bio_city" placeholder="Enter your city" required="" class="w3-bio-input w3-small"/></p>
    <span class="w3-text-blue w3-half">District:</span>
          <p class="w3-text-blue w3-half"><input type="text" name="district" id="bio_district" placeholder="Enter your district" required="" class="w3-bio-input w3-small"/></p>
     <span class="w3-text-blue w3-half">State:</span>
          <p class="w3-text-blue w3-half"><input type="text" name="state" id="bio_state" placeholder="Enter your state" required="" class="w3-bio-input w3-small"/></p>
     <span class="w3-text-blue w3-half">PIN:</span>
          <p class="w3-text-blue w3-half"><input type="text" name="pin" id="bio_pin" onblur="chkPin(this.value,picnf2)" placeholder="Enter your PIN code" required="" class="w3-bio-input w3-small"/></p>
 <div id="bio_a">
  <div class="w3-center">
				<font color="red">
				<span id="picnf2"></span>
				</font>
				</div>
   <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
         <p class="w3-text-dark-blue"><input type="submit" name="uadd" id="uadd" value="Save" class="w3-button w3-half w3-blue"/></p>
        </div>
        </form>  
    <p class="w3-right w3-text-dark-blue"><a href="javascript:bio_education()">Edit<i class="fa fa-edit"></i></a></p>
    <p class="w3-large w3-text-teal w3-center"><b><i class=" fa-fw w3-margin-right w3-text-teal"></i>Educational Details</b></p>
    <form action="./UpdateEdu" method="post">
  		<p class="w3-large w3-text-teal"><b>10th Details:</b></p>
  	<span class="w3-text-blue w3-half">School/Board Name:</span>
  			  <p class="w3-text-blue w3-half"><input type="text" name="sname" id="bio_hsc" placeholder="Enter your school/board name" required="" class="w3-bio-input w3-small"/></p>
  	<span class="w3-text-blue w3-half">Marks:(in percentage)</span>
  			  <p class="w3-text-dark-blue"><input type="text" name="smarks" id="bio_hsc_marks" placeholder="Enter your marks" style="max-width:40%;" required="" class="w3-bio-input w3-small"/>&nbsp;(%)</p>
  	<span class="w3-text-blue w3-half">Pass Out year:</span>
  			  <p class="w3-text-blue w3-half"><input type="text" name="spass" id="bio_hsc_pass" placeholder="Enter pass out year" required="" class="w3-small w3-bio-input w3-right"/></p>
  		<p class="w3-large w3-text-teal"><b>12th/Diploma Details:</b></p>
  	<span class="w3-text-blue w3-half">College/Board Name:</span>
  			  <p class="w3-text-blue w3-half"><input type="text" name="cname" id="bio_inter" placeholder="Enter your college/board name" required="" class="w3-bio-input w3-small"/></p>
  	<span class="w3-text-blue w3-half">Marks:(in percentage)</span>
  			  <p class="w3-text-dark-blue"><input type="text" name="cmarks" id="bio_inter_marks" placeholder="Enter your marks" style="max-width:40%;" required="" class="w3-small w3-bio-input"/>&nbsp;(%)</p>
  	<span class="w3-text-blue w3-half">Pass Out year:</span>
  			  <p class="w3-text-blue w3-half"><input type="text" name="cpass" id="bio_inter_pass" placeholder="Enter pass-out year" required="" class="w3-small w3-bio-input w3-right"/></p>
  <div id="bio_e">
  	<p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="ucontact" id="ucontact" value="Save" class="w3-button w3-half w3-blue"/></p>
    </div>      
   </form>
   </div>
   <br>
 </div>
 <br> 
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
    