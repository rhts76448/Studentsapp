
<script type="text/javascript">
function getNotice(j)
{
	console=document.getElementById(j);
	if (console.className.indexOf("w3-show") == -1) {
        console.className += " w3-show";
    } else { 
        console.className = console.className.replace(" w3-show", "");
    }
}
</script>
<div class="w3-container w3-content w3-padding-64 w3-center w3-card-2" style="max-width:800px">
<br>
<h3 class="w3-blue w3-round-xxlarge w3-center">Notice Board</h3>
 <% 
 NoticeBean[] notice=DataIn.getNotice();
 for(int i=0;i<notice.length;i++)
 { 
 String m=notice[i].getDate()+" : "+notice[i].getSubject();
 %>
 <p class="w3-text-blue">
 <input type="button" onclick="getNotice(this.value)" class="w3-button w3-white w3-round-xxlarge" value="<%=m %>"/></p>
 <p id="<%=m %>" class="w3-round-xxlarge w3-yellow w3-hide"><%=notice[i].getDetails() %></p>
 <%} %>
 <!-- End Page Container -->
</div>
