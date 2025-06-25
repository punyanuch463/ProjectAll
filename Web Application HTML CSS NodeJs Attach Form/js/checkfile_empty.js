const openPopupButton2 = document.getElementById('openPopup2');
    const popupBox2 = document.getElementById('popupBox2');
    const closeButtons2 = document.getElementsByClassName('close2');

    // Function to open the popup
    function openPopup2() {
        popupBox2.style.display = 'block';
    }

    // Function to close the popup
    function closePopup2() {
        popupBox2.style.display = 'none';
    }

    // Event listener for the open popup button
    openPopupButton2.addEventListener('click', openPopup2);

    // Event listeners for close buttons
    for (let closeButton2 of closeButtons2) {
        closeButton2.addEventListener('click', closePopup2);
    }
    const openPopupButton4 = document.getElementById('openPopup4');
    const popupBox4 = document.getElementById('popupBox4');
    const closeButtons4 = document.getElementsByClassName('close4');

    // Function to open the popup
    function openPopup4() {
        popupBox4.style.display = 'block';
    }

    // Function to close the popup
    function closePopup4() {
        popupBox4.style.display = 'none';
    }

    function okpopup() {
      openPopup4();
      return false;
    }
    // Event listener for the open popup button
    openPopupButton4.addEventListener('click', openPopup4);

    // Event listeners for close buttons
    for (let closeButton4 of closeButtons4) {
        closeButton4.addEventListener('click', closePopup4);
    }
     window.onclick = function(event) {
          if (event.target == popupBox4) {
              popupBox4.style.display = "none";
          }
      }


      function CheckMoney() {
        var paymentOption = document.getElementById("payment-option").value;
      //  var paymentValue = document.forms["frm"].pay.value;
      
        if (paymentOption === "20") {   // Code for successful payment of 20 baht
          console.log("test1 = 20 baht");
          document.getElementById("Msgbypay").innerHTML =
            '<div class="texta">' +
            '<h2>' + "Success!" + '</h2>' +
            '<p>' + "You make item for 20 baht.<br>(คุณได้ชำระเงิน 20 บาท)" + '</p>' +
            '<button onclick="return okpopup();" type="submit">' + "OK." + '</button>' +
            '</div>';
          return false;
        }
         else if (paymentOption === "0" ) {
          // Code for successful payment of 40 baht
          console.log("test2 = 0 baht");
          document.getElementById("Msgbypay").innerHTML =
            '<div class="texta">' +
            '<h2>' + "Cancle!" + '</h2>' +
            '<button onclick="return okpopup();" type="submit">' + "OK." + '</button>' +
            '</div>';
          return false;
        } 
        else if (paymentValue === "") {
          // Code for empty payment input
          console.log("User Enter Empty.");
          document.getElementById("Msgbypay").innerHTML =
            '<div class="texta">' +
            '<h2>' + "Enter payment amount" + '</h2>' +
            '<p>' + "Please enter the payment amount." + '</p>' +
            '<button type="submit">OK</button>' +
            '</div>';
          return false;
        } else {
          // Code for incorrect payment amount
          console.log("Invalid payment amount.");
          document.getElementById("Msgbypay").innerHTML =
            '<div class="texta">' +
            '<h2>' + "Invalid payment amount" + '</h2>' +
            '<p>' + "Please enter the correct amount." + '</p>' +
            '<button type="submit">OK</button>' +
            '</div>';
          return false;
        }
  // alert("Please enter the correct amount: 20 baht and 40 baht.");
  // return false;
}

function fileValidation() {
    
  var fileInput = document.getElementById("file");
  var filePath = fileInput.value;
  var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.pdf)$/i;

  if (!allowedExtensions.exec(filePath)) {

    alert("Please enter the image file only. etc. jpg,jpeg,png,pdf ");
    fileInput.value = "";
    return false;
  } else {
    if (fileInput.files && fileInput.files[0]) {
      var file = fileInput.files[0];
      var reader = new FileReader();
    
      reader.onload = function (element) {
        if (file.type === 'application/pdf') {
          document.getElementById("imagePreview").innerHTML =
            '<embed src="' + element.target.result + '" width="800px" height="2100px" />';
        } else {
          document.getElementById("imagePreview").innerHTML =
            '<img width="400px" height="600px" src="' + element.target.result + '"/>';
        }
      };
    
      reader.readAsDataURL(file);
    }
  }  
}
function Checkimage() {
    
    var previewImage = document.getElementById("imagePreview");

    
    if (previewImage.querySelector("img") || previewImage.querySelector("embed")) {
        // alert("An image has been uploaded.");
        document.getElementById("Msgbyfile").innerHTML =
        '<div class="texta"> ' +
        '<h2>'+"Success!"+'</h2>'+
        '<p> ' + "An image has been uploaded." + '</p>'+
        '<button type="submit" >'+" OK" + '</button>'+
        '</div>';
        console.log("Pass.");
        return false;
        // return true;
        
    }
     else {
      document.getElementById("Msgbyfile").innerHTML =
      '<div class="texta">' +
      '<h2>' + "Upload an image" + '</h2>' +
      '<p>' + "Please upload an image." + '</p>' +
      '<button type="submit" id="uploadBtn">' + "OK" + '</button>' +
      '</div>';
        // alert("Please upload an image.");
        return false;
    }
}

   
