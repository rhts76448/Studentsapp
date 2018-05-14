
 <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <style>
.quarter{width:25%;float:left;}
</style>
<form action="./AttendanceAction">
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center w3-col">
<div class="w3-center" id="sheet">
 
 <%
 Profile[] ob=(Profile[])session.getAttribute("students");
 String sub=(String)session.getAttribute("sub");
  if(ob.length<1){
	 %>
	 <div class="w3-center w3-text-red">No data found</div>
	 <%}else 
	 {
 for(int i=0;i<ob.length;i++)
 {
	
 %>
 <div class="w3-col w3-white w3-round-xxlarge w3-center">
 <span class="quarter"><%=i+1 %></span>
 <span class="quarter"><%=ob[i].getRegdno()%></span>
<span class="quarter">&nbsp;&nbsp;<%=ob[i].getName() %></span>
<span class="quarter"><input type="checkbox" value="<%=ob[i].getRegdno()%>" name="check"></span>
</div>
 
<%} %>
 </div>
 </div>
<div  class="w3-center" >
   <input type="submit" value="Submit" class="w3-button w3-round-xxlarge w3-blue">
   </div>
   <%} %>
 </div>
</form>