<script src="js/nav.js"></script>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="./Controller?name=qdhfjbfkshfbffjkonfjbnm ckvjfoivvfxlkvejdnjvn9rkjijxknijidjhnjcjncicnjdhidhhd" class="w3-bar-item w3-button w3-padding-large">STUDENT's <font size="5" color="blue"><b>&nbsp;aPP</b></font></a>
    <a href="./Controller?name=qdhfjbfkshfbffjkoiowkxjmksjowxxkjijxknijidjhnjcjncicnjdhidhhd" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Profile</a>
    <a href="./Controller?name=qdhfjbfkshfbffjkoiowkxjmksff4jowxxkjijxk6fbjhnjcjncicnjdhidhhdsjhbbkjuicxb" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Notification</a>
    <a href="./Controller?name=hbdugunjjsdnkni73bhbtctydcbjcwwfdbdiic225bncsdbnjbjsdsbncj cj4njsbcjsdbcjsdc" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Results</a>
    <a href="./Controller?name=qazwsdcvedfgbnghjm,ujhkjnhbgdcgfghbjnkjhvdfghkjlkkdjvdfvjndfvkvbdfjkvbvjkbvkdfkbdfjkvbkvvdfk" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Attendance Sheet</a>
     <a href="./Controller?name=hgvhcdhhvcscbj, cuhioclksncvhjcjknclcclcnlj;askdl;jd;jklncknklchiocn.mczklcjpoc.m cvhjccc zk" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Log Out</a>
  </div>
</div>

<%
String[] fcltyList=DataIn.getFcltyList();
String mnb2=(String)session.getAttribute("regd");
if(mnb2==null)
{
	%>
	<jsp:forward page="/jsp/LogOut.jsp"/> 
	
	<%
}
%>
<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
<form action="./SearchBox" method="post ">
<input type="text" name="q" id="q" style="width:50%" list="lists" required="" title="Enter User Name(for faculty)/Regd.no(for student)" class="w3-black w3-input"Placeholder="Enter User Name/Regd.no">
<datalist id="lists">
<%
for(int i=0;i<fcltyList.length;i++){
%>
<option><%=fcltyList[i] %></option>
<%} %>
</datalist>
</form>
  <a href="./Controller?name=qdhfjbfkshfbffjkoiowkxjmksjowxxkjijxknijidjhnjcjncicnjdhidhhd" class="w3-bar-item w3-button w3-padding-large">Profile</a>
  <a href="./Controller?name=qdhfjbfkshfbffjkoiowkxjmksff4jowxxkjijxk6fbjhnjcjncicnjdhidhhdsjhbbkjuicxb" class="w3-bar-item w3-button w3-padding-large">Notification</a>
  <a href="./Controller?name=hbdugunjjsdnkni73bhbtctydcbjcwwfdbdiic225bncsdbnjbjsdsbncj cj4njsbcjsdbcjsdc" class="w3-bar-item w3-button w3-padding-large">Results</a>
  <a href="./Controller?name=qazwsdcvedfgbnghjm,ujhkjnhbgdcgfghbjnkjhvdfghkjlkkdjvdfvjndfvkvbdfjkvbvjkbvkdfkbdfjkvbkvvdfk" class="w3-bar-item w3-button w3-padding-large">Attendance Sheet</a>
  <a href="./Controller?name=hgvhcdhhvcscbj, cuhioclksncvhjcjknclcclcnlj;askdl;jd;jklncknklchiocn.mczklcjpoc.m cvhjccc zk" class="w3-bar-item w3-button w3-padding-large">Log Out</a>
</div>