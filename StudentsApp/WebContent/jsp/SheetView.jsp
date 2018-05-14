
 <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
<form action="./AttendanceAction">
<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<div class="w3-center w3-col">
 <%
 String[] ob=(String[])session.getAttribute("attdt");
 session.removeAttribute("attdt");
 if(ob.length<1){
	 %>
	 <div class="w3-center w3-text-red">No data found</div>
	 <%}else{%>
	 <p class="w3-input w3-white w3-text-blue w3-round-xxlarge">Total no of class: <%=ob.length%></p>
<table align="center" id="sheet">
 
<% 
 for(int i=0;i<ob.length;i++)
 {
 %>
 <tr align="center">
 <td> <input type="submit" value=<%=ob[i] %> name="attdt" class="w3-wide w3-button w3-center w3-blue w3-round-xxlarge"></td>
 </tr>
<%} %>
 </table>
 <%} %>
 </div>
 </div>
</form>