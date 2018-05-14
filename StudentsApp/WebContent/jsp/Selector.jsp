 <form action="./Attendence" >
<div class="w3-container w3-content w3-padding-64" style="max-width:800px">
<h2 class="w3-wide w3-center w3-blue w3-round-xxlarge">Attendance Sheet</h2>
<h3 class="w3-center w3-blue w3-round-xxlarge">Semester</h3>
<div class="w3-blue w3-round-xxlarge w3-center">
<select name="semester" id="semester" class="w3-select w3-round-xxlarge w3-center w3-white" required="" onchange="getSubject()">
<option value="-1">choose semester</option>
<option value="1">1st Semester</option>
<option value="2">2th Semester</option>
<option value="3">3th Semester</option>
<option value="4">4th Semester</option>
<option value="5">5th Semester</option>
<option value="6">6th Semester</option>
<option value="7">7th Semester</option>
<option value="8">8th Semester</option>
</select>
</div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Branch</h3>
<div class=" w3-blue w3-round-xxlarge w3-center"><select class="w3-select w3-center w3-round-xxlarge w3-white w3-center" name="branch" id="branch" onchange="getSubject()" required=""><option value="-1">Choose branch</option></select></div>
<h3 class="w3-center w3-blue w3-round-xxlarge">Subject</h3>
<div class="w3-blue w3-round-xxlarge w3-center"><select id="subject" name="subject" class="w3-center w3-select w3-round-xxlarge w3-white" required=""><option value="-1">choose subject</option></select></div>
<div class="w3-center">
<input type="button" value=" " class="w3-button w3-quarter w3-round-xxlarge w3-center">
<input type="submit" value="view" name="click" class=" w3-quarter w3-blue w3-round-xxlarge w3-center" onclick="return selectChk()">
<input type="submit" value="generate OTC" name="click" class=" w3-quarter w3-blue w3-round-xxlarge w3-center" onclick="return selectChk()">
<input type="button" value=" " class="w3-button w3-quarter w3-round-xxlarge w3-center">
</div></div>
<script>

function selectChk()
{
	sub= document.getElementById("subject").value;
	brch=document.getElementById("branch").value;
	sem=document.getElementById("semester").value;
	if(sub=="-1" || sem=="-1" || brch=="-1")
		{
		alert("please select all elements");
		v=false;
		}
	else
		v=true;
	return v;
}
</script>
</form>