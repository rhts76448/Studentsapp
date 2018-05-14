// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

// When the user clicks anywhere outside of the modal, close it

/*window.onclick = function(event) {
	var y = document.getElementById("navDemo");
  if (event.target != y) {
	  y.className = y.className.replace(" w3-show", "");
  }
}
*/