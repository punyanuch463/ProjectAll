function oldname() {
    var oename = document.getElementById("oename").value;
    var otname = document.getElementById("otname").value;
    submitOK = true;
  
    // Check for null values
    if (otname.trim() === "") {
      alert("Please enter a name");
      submitOK = false;
  }
// โดนดักจับได้

  // if (otname.length > 10 || oename.length > 10) {
  //     alert("The name may have no more than 10 characters");
  //     submitOK = false;
  // }
  if (otname.length > 40 || oename.length > 40) {
    alert("The name may have no more than 40 characters");
    submitOK = false;
}

  if (submitOK === false) {
      return false;
  }
    }
 

function newname() {
    var nename = document.getElementById("nename").value;
    var ntname = document.getElementById("ntname").value;
    submitOK = true;
   // Check for null values
//    if (nename.trim() === "") {
//     alert("Please enter a name");
//     submitOK = false;
// }
// โดนดักจับได้

// if (otname.length > 10 || oename.length > 10) {
//     alert("The name may have no more than 10 characters");
//     submitOK = false;
// }
// if (ntname.length > 40 || nename.length > 40) {
//   alert("The name may have no more than 40 characters");
 
//   submitOK = false;
// }

// if (submitOK === true) {
//   // openPopup();
//     return false;
// }

    if (ntname.length > 10) {
      alert("The name may have no more than 10 characters");
      submitOK = false;
    } 
  
    if (nename.length > 10) {
      alert("The name may have no more than 10 characters");
      submitOK = false;
    }
  
    if (submitOK == false) {
      return false;
    }
  }

function MBphone() {
    var phonenum = document.getElementById("phonenum").value;
    submitOK = true;
  
    if (phonenum.length === 10) {
      alert("The mobile phone number must have 10 digits");
      submitOK = false;
    }
  
    if (submitOK == false) {
      return false;
    }
  }
  const openPopupButton = document.getElementById('openPopup');
    const popupBox = document.getElementById('popupBox');
    const closeButtons = document.getElementsByClassName('close');

    // Function to open the popup
    function openPopup() {
        popupBox.style.display = 'block';
    }

    // Function to close the popup
    function closePopup() {
        popupBox.style.display = 'none';
    }

    // Event listener for the open popup button
    openPopupButton.addEventListener('click', openPopup);

    // Event listeners for close buttons
    for (let closeButton of closeButtons) {
        closeButton.addEventListener('click', closePopup);
    }

function okpopup() {

    openPopup();
    return false;
  }
