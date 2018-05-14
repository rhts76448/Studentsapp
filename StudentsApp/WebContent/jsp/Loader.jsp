<script type="text/javascript">
var jsArr = new Array();
var jsArrr1 = new Array();
var jsArrr2 = new Array();
var jsArrr3 = new Array();
var jsArrr4 = new Array();
var jsArrr5 = new Array();
var jsArrr6 = new Array();
var jsArrr7 = new Array();
var jsArrr8 = new Array();

<%
for (int j=0; j < brch1.length; j++)
{
%>
jsArr[<%= j %>] = '<%=brch1[j] %>';
<%}%>

function bodyLoad()
	{
	
  brch= document.getElementById("branch");
  
  for(var i=0; i<jsArr.length; i++)
  {
     var opt = document.createElement("option");
     opt.text=jsArr[i];
     opt.value=jsArr[i];
     brch.appendChild(opt);
  }
	}
</script>
<script>
<%
for (int i=0; i < sm1.length; i++)
{
%> jsArrr1[<%=i%>] = new Array();
<%
	for(int j=0;j<sm1[i].length;j++)
		{%>
	jsArrr1[<%= i %>][<%=j%>] = '<%=sm1[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm2.length; i++)
{
%> jsArrr2[<%=i%>] = new Array();
<%
	for(int j=0;j<sm2[i].length;j++)
		{%>
	jsArrr2[<%= i %>][<%=j%>] = '<%=sm2[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm3.length; i++)
{
%> jsArrr3[<%=i%>] = new Array();
<%
	for(int j=0;j<sm3[i].length;j++)
		{%>
	jsArrr3[<%= i %>][<%=j%>] = '<%=sm3[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm4.length; i++)
{
%> jsArrr4[<%=i%>] = new Array();
<%
	for(int j=0;j<sm4[i].length;j++)
		{%>
	jsArrr4[<%= i %>][<%=j%>] = '<%=sm4[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm5.length; i++)
{
%> jsArrr5[<%=i%>] = new Array();
<%
	for(int j=0;j<sm5[i].length;j++)
		{%>
	jsArrr5[<%= i %>][<%=j%>] = '<%=sm5[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm6.length; i++)
{
%> jsArrr6[<%=i%>] = new Array();
<%
	for(int j=0;j<sm6[i].length;j++)
		{%>
	jsArrr6[<%= i %>][<%=j%>] = '<%=sm6[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm7.length; i++)
{
%> jsArrr7[<%=i%>] = new Array();
<%
	for(int j=0;j<sm7[i].length;j++)
		{%>
	jsArrr7[<%= i %>][<%=j%>] = '<%=sm7[i][j] %>';
<%}}%>

<%
for (int i=0; i < sm8.length; i++)
{
%> jsArrr8[<%=i%>] = new Array();
<%
	for(int j=0;j<sm8[i].length;j++)
		{%>
	jsArrr8[<%= i %>][<%=j%>] = '<%=sm8[i][j] %>';
<%}}%>

function getSubject()
{
	
sub= document.getElementById("subject");
sub.innerHTML="Choose a subject";
semster=document.getElementById("semester").value;
brch= document.getElementById("branch").value;
var j = jsArr.indexOf(brch);
switch(semster)
{
case "1":
	for(var i=0;i<jsArrr1[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr1[j][i];
    opt.value=jsArrr1[j][i];
    sub.appendChild(opt);
	}
		break;
case "2":
	for(var i=0;i<jsArrr2[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr2[j][i];
    opt.value=jsArrr2[j][i];
    sub.appendChild(opt);
	}
		break;
case "3":
	for(var i=0;i<jsArrr3[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr3[j][i];
    opt.value=jsArrr3[j][i];
    sub.appendChild(opt);
	}
		break;
case "4":
	for(var i=0;i<jsArrr4[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr4[j][i];
    opt.value=jsArrr4[j][i];
    sub.appendChild(opt);
	}
		break;
case "5":
	for(var i=0;i<jsArrr5[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr5[j][i];
    opt.value=jsArrr5[j][i];
    sub.appendChild(opt);
	}
		break;
case "6":
	for(var i=0;i<jsArrr6[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr6[j][i];
    opt.value=jsArrr6[j][i];
    sub.appendChild(opt);
	}
		break;
case "7":
	for(var i=0;i<jsArrr7[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr7[j][i];
    opt.value=jsArrr7[j][i];
    sub.appendChild(opt);
	}
		break;
case "8":
	
		for(var i=0;i<jsArrr8[j].length;i++)
	{
	var opt = document.createElement("option");
    opt.text=jsArrr8[j][i];
    opt.value=jsArrr8[j][i];
    sub.appendChild(opt);
	}
		break;
}
}

</script>
