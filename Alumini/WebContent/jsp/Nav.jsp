<script src="js/nav.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/w3.css">
<style>
.ban{
height:80px;
text-align:justify ;
border:0px solid #676767;
padding-left:20px;
padding-top:0px;
margin-top:10px;
margin-bottom:10px;
background-color:#fff;
}
.bantitle{
color:#7220DF;
padding-top:10px;
margin-top:10px;
/*border:1px solid #888888;*/
position:relative;
/*  -webkit-transform: rotateY(130deg); 
    transform: rotateY(130deg); */
	/* Chrome, Safari, Opera */
    -webkit-animation-name: example; /* Chrome, Safari, Opera */
   -webkit-animation-duration:3600s; /* Chrome, Safari, Opera */ 
    animation-name: example;
    animation-duration: 4s; 
}
@-webkit-keyframes example {
    0%   {color:#00C5EE;}
    25%  {color:#FF80FF;}
    50%  {color:#00C5EE;}
    90% {color: #FF80FF;}
	100% {color:#00cfee;}
}
;
/* Standard syntax */
@keyframes example {
    0%   {color:#00C5EE;}
    25%  {color:#FF80FF;}
    50%  {color:#00C5EE;}
    90% {color: #FF80FF;}
	100% {color:#00cfee;}
}
.tbottom{
font-size:8pt;
position:relative;
}
.fix{position:fixed;width:100%;top:4}</style>
<!-- Navbar -->
<div class="w3-top w3-white">
<div class="w3-container w3-content w3-center ban w3-hide-small" style="max-width:800px">
<img src="images/rec logo.jpg" class="w3-image w3-left">
<h3 class="w3-center bantitle">Raajdhani Engineering College</h3>
<p class="w3-center tbottom">An Alumni Association of Dept. of CSE,REC</p>
<br>
</div>
<div class="w3-container w3-content w3-center ban w3-hide-medium w3-hide-large" style="max-width:800px">
<img src="images/rec logo.jpg" class="w3-image w3-left" style="width:30%;">
<p class="w3-center bantitle">Raajdhani Engineering College</p>
<span class="w3-center tbottom">An Alumni Association of Dept. of CSE,REC</span>
</div>
  <div class="w3-bar w3-cyan w3-card-2 w3-small w3-text-white">
  <div class="w3-card-4 w3-center w3-container w3-content w3-round-xxlarge" style="max-width:800px"><b>
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
     <a href="./Controller?q=qlotypoqrttvybnjdcnidcnncidncidncvsdvvhbncnncisdcncisdcnisdisdssccvvjnunh" class="w3-bar-item w3-button w3-padding-large">HOME</a>
     <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ALUMNI</a>
     <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small">EVENTS</a>
     <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACTS</a>
    <a href="./Controller?q=qoptryuionhdfhbnsnooshjuiossdnc674y7wbsdhcyjhb chjsdisniomoocbuyffsdsv g gvgj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOG IN</a>
 
 </b></div> 
   </div>
</div>
<br>
<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-cyan w3-hide w3-hide-large w3-hide-medium fix" style="margin-top:46px"><b>
<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large ">ALUMNI</a>
     <a href="#" class="w3-bar-item w3-button w3-padding-large ">EVENTS</a>
     <a href="#" class="w3-bar-item w3-button w3-padding-large ">CONTACTS</a>
    <a href="./Controller?q=qoptryuionhdfhbnsnooshjuiossdnc674y7wbsdhcyjhb chjsdisniomoocbuyffsdsv g gvgj" class="w3-bar-item w3-button w3-padding-large ">LOG IN</a>
    
</b> </div>