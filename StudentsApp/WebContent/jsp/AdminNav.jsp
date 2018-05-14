<style>
            .round1 {
                border-radius: 50%;
                overflow: hidden;
                width: 50px;
                height: 50px;
            }
            .round1 img {
                 display: block;
                margin-top:20px;
            /* Stretch 
                  height: 100%;
                  width: 100%; */
            min-width: 100%;
            min-height: 100%;
            }
        </style>
<script src="js/nav.js"></script>
<!-- Navbar -->

<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-left" href="#" onclick="myFunction()" title="Action Center"><i class="fa fa-bars"></i></a>
    
   <a href="./AdminController?name=vhjbdhjvbdhjbvhjsdgfysbmncbdukvhsjkdbkjsdhkcshskjcbsdjhdcgjkcnzb" class="w3-right w3-bar-item w3-button w3-padding-large">STUDENT's <font size="5" color="blue"><b>&nbsp;aPP</b></font></a>
   </div>
<!-- Navbar on small screens -->
<%
String[] fcltyList=DataIn.getFcltyList();
String mnb1=(String)session.getAttribute("regd");
if(mnb1==null)
{
	%>
	<jsp:forward page="/jsp/LogOut.jsp" /> 
	
	<%
}
%>
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-left" style="width:165px">
<div class="w3-blue"><img src="Images/admin.gif" class="round1 w3-center"/>&nbsp;&nbsp;<a href="./AdminController?name=dvhdfhjvbdfhjhsuidhcjksdnbcsdvcuyh4hbjbd7scjbjcb93 b cjbsd5kbvjbsjkvbjkv" class="w3-button">Admin</a></div>
<form action="./SearchBox" method="post ">
<input type="text" name="q" id="q" list="lists" required="" title="Enter User Name(for faculty)/Regd.no(for student)" class="w3-black w3-input"Placeholder="Enter User Name/Regd.no">
<datalist id="lists">
<%
for(int i=0;i<fcltyList.length;i++){
%>
<option><%=fcltyList[i] %></option>
<%} %>
</datalist>
</form>
 <!-- <a href="#" class="w3-bar-item w3-button w3-padding-small">Change Password<i class="fa fa-pencil w3-right"></i></a>
 <a href="./AdminController?name=dvhdfhjvbdfhjhsuidhcjksdnbcsdvcuyhsdfvbhf   hdbvdfdbvvjkdfbviudfvbnvjkbvjbsjkvbjkv" class="w3-bar-item w3-button w3-padding-small">New Student</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-small">New Faculty</a> -->
  <a href="./AdminController?name=fbsuncnkanfffddddfnnndcccnhd  idvnnnnskkkkkkkkkkkkkvvknkvnvknmx mvxvv dddd" class="w3-bar-item w3-button w3-padding-small">Manage Branches</a>
  <a href="./AdminController?name=hbsdhbvycgbjhsbkkkkbcmmuhhdhksiinis  cjbjccbuhbfjhbjfffssdhchusdhcsdbcjdcs" class="w3-bar-item w3-button w3-padding-small">Manage Subjects</a>
  <a href="./AdminController?name=vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjshcusbcjsdghjusdghcjbsjsjcgsddufgsddu" class="w3-bar-item w3-button w3-padding-small">Notice Board</a>
  <a href="./AdminController?name=vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjshcusbcjsdghjb38uyn348yfyd4848ursdjnu" class="w3-bar-item w3-button w3-padding-small">Faculty List</a>
  <a href="./AdminController?name=vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjsd4848uvvini580bmikbmbbdfdnmmkersdjnu" class="w3-bar-item w3-button w3-padding-small">Students List</a>
  <a href="./AdminController?name=vhjhsvchjsdsvcxhv hykiuddib hcb6j78idcn38nffkn59nnn558n999ibdfdnmmkersdjnu" class="w3-bar-item w3-button w3-padding-small">View Attendance</a>
  <a href="./AdminController?name=vhjhsvchjsdsvcxhv hykiuddib hcb6j78idcn3n4ucb84fjnfduigr9eer uihf9834hfbff" class="w3-bar-item w3-button w3-padding-small">Promot Sem</a>
  <a href="./AdminController?name=yesult fbsddfbsddfsdydgbvbhvbvuyxbkbksddbfisdhfhuisdbvbhjvbhjbvhjbvhjdbdvb" class="w3-bar-item w3-button w3-padding-small">Results</a>
  <a href="./Controller?name=hgvhcdhhvcscbj, cuhioclksncvhjcjknclcclcnlj;askdl;jd;jklncknklchiocn.mczklcjpoc.m cvhjccc zk" class="w3-bar-item w3-button w3-padding-small">Log Out</a>
</div>
</div>
