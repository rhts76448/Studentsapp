
 <%@page import="com.students.dbconn.DataIn"%>
     <%@page import="com.students.bean.Profile"%>
     <style>
.third{width:33%;float:left;}
</style>
<form>
<div class="w3-container w3-content w3-padding-64 w3-card-2" style="max-width:800px">
<div class="w3-center w3-col">
<div class="w3-center" id="sheet">
 
 <%
 Profile[] ob=(Profile[])session.getAttribute("sview");
 String sub=(String)session.getAttribute("sub");
 if(ob.length<1){
 %>
 <div class="w3-center w3-text-red">No data found</div>
 <%} else{%>
 <p class="w3-input w3-white w3-text-blue w3-round-xxlarge">Total no of Students attended: <%=ob.length%></p>
 <% for(int i=0;i<ob.length;i++){ %>
 <div class="w3-col w3-white w3-round-xxlarge">
 <span class="third"><%=i+1 %></span>
 <span class="third"><%=ob[i].getRegdno()%></span>
<span class="third">&nbsp;&nbsp;<%=ob[i].getName() %></span>
</div>
<%} }%>
 </div>
 </div>
 </div>
</form>