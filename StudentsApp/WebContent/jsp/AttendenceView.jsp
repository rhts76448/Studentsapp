  <script>
  var attnd=new Array();
  var tatt=new Array();
  <%
  for (int i=0; i < s.length; i++)
  {
  %> attnd[<%=i%>] = new Array();
  <%
  	for(int j=0;j<s[i].length;j++)
  		{%>
  	attnd[<%= i %>][<%=j%>] = '<%=s[i][j].getAtt() %>';
  <%}}%>
  <%
  for (int i=0; i < s.length; i++)
  {
  %> tatt[<%=i%>] = new Array();
  <%
  	for(int j=0;j<s[i].length;j++)
  		{%>
  	tatt[<%= i %>][<%=j%>] = '<%=s[i][j].getT_att() %>';
  <%}}%>
  var sub=new Array();
  <%
  for (int i=0; i < s.length; i++)
  {
  %> sub[<%=i%>] = new Array();
  <%
  	for(int j=0;j<s[i].length;j++)
  		{%>
  	sub[<%= i %>][<%=j%>] = '<%=s[i][j].getSubject() %>';
  <%}}%> 

  function getAttendance(j)
  {
  	console=document.getElementById("console"+j);
  	console.innerHTML="";
  	if (console.className.indexOf("w3-show") == -1) {
          console.className += " w3-show";
      } else { 
          console.className = console.className.replace(" w3-show", "");
      }
  	//branch=document.getElementById("btn"+j).value;
  	for(var i=0;i<attnd[j].length;i++)
  	{
  	var prg=document.createElement("p");
  	prg.className="w3-input w3-white w3-center w3-text-blue w3-round-xlarge";
  	console.appendChild(prg);
  	 opt1=sub[j][i];
  	 opt2=attnd[j][i];
  	 opt3=tatt[j][i];
  	prg.innerHTML=opt1+" || "+opt2+"/"+opt3;
     
  	}	
  }
        </script>	
 
 <div class="w3-container w3-card-2 w3-text-blue w3-margin-bottom">
     <p class="w3-large w3-text-teal w3-center w3-card-4"><b>Attendance</b></p>
     <br>
    <div class="w3-center w3-container w3-card-2">
   <%
   if(sm.length<1)
   {%>
		  <p class="w3-center">No data found...</p>
<%}else
{for(int i=0;i<sm.length;i++){%>
 <p><input type="button" name="btn<%=i %>" onclick="getAttendance(<%=i%>)" value="<%=Checker.semEncode(sm[i])%> Semester" name="semester"class="w3-blue w3-round-xlarge"/></p>
 <div id="console<%=i %>" class="w3-hide w3-center"></div>
   <%}} %>
 </div>
 <br>  </div>