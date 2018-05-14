<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<%
String otp=(String)session.getAttribute("otp");
session.removeAttribute("otp");

%>
<h2 class="w3-center w3-white w3-container w3-card-2 w3-text-blue w3-round-xxlarge">
<%=otp %></h2>
<p class="w3-text-red">
Note*:-Remember you can't generate next OTC for next five minutes.Also OTC is valid only for next five minutes.
</div>