<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>REC Online Alumni</title>
</head>
<body>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
<%@include file="Nav.jsp" %>
<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px">
<br>
<div class="">
<br>
<form action="./Register1" method="post">
<table class="w3-table w3-text-cyan">
<tr><td  colspan="2" class="w3-center w3-text-white w3-cyan w3-padding-small w3-round-xlarge"><b>Register</b></td></tr>
<tr><td><td></tr>
<tr><td colspan="2" class="w3-text-white w3-cyan w3-padding-small w3-round-xlarge">Personal Information</td><tr>
<tr>
<td>Name*:</td>
<td><input type="text" class="w3-input w3-text-cyan" placeholder="Enter Your Name" name="name" id="name" required=""/></td>
</tr>
<tr>
<td>Gender*:</td>
<td><input type="radio" class="w3-radio" name="gender" value="male" required="">Male&nbsp;&nbsp;
<input type="radio" class="w3-radio" name="gender" value="female" required="">Female</td>
</tr>
<tr>
<td>Date of Birth*:</td>
<td><input type="date" name="dob" id="dob" class="w3-date w3-input w3-text-cyan" required=""/></td>
</tr>
<tr><td>Residential Address*:</td>
<td><input type="text" name="address" placeholder="Address Line" class="w3-input w3-text-cyan" required=""/></td>
</tr>
<tr><td></td><td><input type="text" name="city" placeholder="City" class="w3-input w3-text-cyan" required=""/></td></tr>
<tr><td></td><td ><input type="text" name="district" placeholder="District" class="w3-input w3-text-cyan" required=""/></td></tr>
<tr><td></td><td ><input type="text" name="state" placeholder="State" class="w3-input w3-text-cyan" required=""/></td></tr>
<tr><td></td><td ><input type="number" name="pin" placeholder="PIN" class="w3-input w3-text-cyan" required=""/></td></tr>
<tr><td>Mobile no*:</td>
<td><input type="number" value=91 name="con1" class="w3-text-cyan" required="" style="width:20%;padding:8px;border:none;float:left;border-bottom:1px solid #ccc;"/>
<input type="number" placeholder="Mobile no" name="con2" class="w3-text-cyan" required="" style="width:80%;padding:8px;float:left;border:none;border-bottom:1px solid #ccc;"/>
</td>
</tr>
<tr>
<td>Email id*:</td>
<td><p class="w3-input w3-text-cyan"><%=(String)session.getAttribute("uemail") %></p>
</td></tr>
 <tr><td colspan="2" class="w3-text-white w3-cyan w3-padding-small w3-round-xlarge">Batch Information</td></tr>
<tr>
<td>Year of passing*:</td>
<td><input type="number" minlength="4"  maxlength="4" class="w3-input w3-text-cyan" required="" id="batch" name="batch"/></td>
</tr>
<tr>
<td>Stream*:</td>
<td><p class="w3-input w3-text-cyan">Computer Science & Engineering</p></td>
</tr>
<tr>
<td>Regd.no:</td>
<td><input type="text" name="regdno" id="regd" class="w3-input w3-text-cyan" placeholder="Registration no"/></td>
</tr>
<tr><td colspan="2" class="w3-text-white w3-cyan w3-round-xlarge w3-padding-small">Professional Information</td></tr>
<tr>
<td>Qualification*:</td>
<td><input type="text" name="qualification" id="qualification" class="w3-input w3-text-cyan" placeholder="e.g. MBA/B.Tech" required=""/></td>
</tr>
<tr>
<td>Occupation*:</td>
<td><input type="text" name="occupation" class="w3-input w3-text-cyan" placeholder="e.g. Enginner/HoD/CEO" required="" /></td>
</tr>
<tr><td>Office Address:</td>
<td><input type="text" name="offaddress" placeholder="Address Line" class="w3-input w3-text-cyan" /></td>
</tr>
<tr><td></td><td><input type="text" name="offcity" placeholder="City" class="w3-input w3-text-cyan" /></td></tr>
<tr><td></td><td ><input type="text" name="offdistrict" placeholder="District" class="w3-input w3-text-cyan" /></td></tr>
<tr><td></td><td ><input type="text" name="offstate" placeholder="State" class="w3-input w3-text-cyan" /></td></tr>
<tr><td></td><td ><input type="number" name="offpin" placeholder="PIN" class="w3-input w3-text-cyan" /></td></tr>
<tr><td></td><td></td></tr>
<tr><td colspan="2" class="w3-center">
<input type="submit" class="w3-button w3-cyan w3-text-white w3-round-xxlarge" value="Submit"/>
</td></tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>