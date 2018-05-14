  <div class="w3-center">
      <br>
            <img src='./RetrivePic?imageId=<%=ob.getRegdno() %>' class="round" onError="this.onerror=null;this.src='Images/favtar.png';" alt="<%=ob.getName()%>"/>
      
        </div>
        <div class="w3-display-container w3-container w3-text-black">
          
<span class="w3-right w3-text-dark-blue"><a href="javascript:update_pic()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
            <h2><%=ob.getName() %></h2>
        </div>
        <div class="w3-container">
        <div id="u_pic">
          <form action="./UpdatePic" method="post" enctype="multipart/form-data">
          <p class="w3-text-dark-blue"><input type="file" name="pic" id="pic" placeholder="Choose file" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="button" name="cancel" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" value="Upload" class="w3-button w3-half w3-blue"/></p>
          </form></div>
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getBranch() %></p>
          <p class="w3-large"><i class="fa fa-star fa-fw w3-margin-right w3-large w3-text-teal"></i><%=reg %></p>
          <p><i class="fa fa-calendar fa-fw w3-margin-right w3-text-teal"></i><%=ob.getDob() %></p>
          <div id="add">
          <%
          if(ob1.getCity()!=null)
          {
        	%>
        	<span class="w3-right w3-text-dark-blue"><a href="javascript:update_add()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob1.getCity() %>, <%=ob1.getState() %></p>
          
          <%
          }
          else
          {
        	  %>
          <p class="w3-text-dark-blue"><a href="javascript:update_add()"><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>Please update your address</a></p>
          <%} %>
          </div>
          <div id="u_add"> 
          <form action="./UpdateAddress" method="post">
          <p class="w3-text-dark-blue"><input type="text" name="address" id="address" placeholder="Enter your address" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="text" name="city" id="city" placeholder="Enter your city" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="text" name="district" id="district" placeholder="Enter your district" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="text" name="state" id="state" placeholder="Enter your state" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="text" name="pin" id="pin" onblur="chkPin(this.value,picnf)" placeholder="Enter your PIN" required="" class="w3-input w3-small"/></p>
            <div>
				<font color="red">
				<span id="picnf"></span>
				</font>
				</div>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="uadd" id="uadd" value="Save" class="w3-button w3-half w3-blue"/></p>
         </form>
          </div>
          <div id="mail">
          <span class="w3-right w3-text-dark-blue"><a href="javascript:update_mail()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getEmail() %></p>
          </div>
          <div id="u_mail">
          <form action="./UpdateMail" method="post">
          <p class="w3-text-dark-blue"><input type="email" name="email" id="email" placeholder="Enter your email address" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="umail" id="umail" value="Save" class="w3-button w3-half w3-blue"/></p>
          </form></div>
          <div id="contact">
          <span class="w3-right w3-text-dark-blue"><a href="javascript:update_contact()">Edit<i class="fa fa-edit fa-fw w3-margin-right w3-large"></i></a></span>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=ob.getPhoneNo() %></p>
           </div>
           <div id="u_contact">
          <form action="./UpdateMob" method="post">
          <p class="w3-text-dark-blue"><input type="text" name="phone_number" id="phone_number" onblur="chkPhone(this.value,pcnf)" placeholder="Enter your contact no" required="" class="w3-input w3-small"/></p>
          <div>
				<font color="red">
				<span id="pcnf"></span>
				</font>
				</div>
          <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="ucontact" id="ucontact" value="Save" class="w3-button w3-half w3-blue"/></p>
          </form></div>
          <div id="password">
          <p class="w3-text-dark-blue"><a href="javascript:change_pass()"><i class="fa fa-lock fa-fw w3-margin-right w3-large w3-text-teal"></i>Change password</a></p>
          <%
          String msg=(String)session.getAttribute("msg");
          session.removeAttribute("msg");
          if(msg!=null)
          {
          %>
          <p class="w3-text-red"><%=msg %></p>
          <%} %>
          </div>
          <div id="u_password">
           <form action="./UpdatePassword" method="post">
          <p class="w3-text-dark-blue"><input type="password" name="current" id="current" placeholder="Enter your current password" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="password" name="password1" id="password1" placeholder="Enter your new password(7 to 20)" onkeyup="chkPass()" required="" class="w3-input w3-small"/></p>
          <p class="w3-text-dark-blue"><input type="password" name="password2" id="password2" placeholder="Re-enter your new password" onblur="cnfPass()" required="" class="w3-input w3-small"/></p>
          <div class="w3-center">
				<font color="red">
				<span id="cnf"></span>
				</font>
				</div>
           <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="cancel" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="ucontact" id="ucontact" value="Save" class="w3-button w3-half w3-blue"/></p>
          </form>
          </div>
          <div id="deactive">
          <p class="w3-text-dark-blue"><a href="javascript:conf_deactive()"><i class="fa fa-heart fa-fw w3-margin-right w3-large w3-text-teal"></i>Deactive account</a></p>
          </div>
          <div id="cnf_deactive" class="w3-white w3-container w3-text-dark-blue">
          <form action="./Deactive" method="post">
         <p class="w3-text-dark-blue"><i class="fa-fw w3-margin-right w3-large w3-text-teal"></i>Are you sure?</p>
           <p class="w3-text-dark-blue"><input type="button" name="cancle" id="cancle" value="No" onclick="bodyLoad()" class="w3-button w3-half w3-light-grey w3-text-blue"/></p>
          <p class="w3-text-dark-blue"><input type="submit" name="deactive" id="deactive" value="Yes,Deactive" class="w3-button w3-half w3-blue"/></p>
          </form></div>   
</div>

