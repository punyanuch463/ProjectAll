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
        console.log("test")
        document.getElementById("Msgbyfile").innerHTML =
        '<div class="texta">' +
        '<h2>'+"Sucess!"+'</h2>'+
        '<p>' + "An image has been uploaded." + '</p>' +
          '<button onclick="return okpopup();" type="submit">'+"OK."+'</button>' + 
        '</div>';
        console.log("Pass.");
        return false;
        
    } else {
      document.getElementById("Msgbyfile").innerHTML =
      '<div class="texta">' +
      '<h2>' + "Upload an image" + '</h2>' +
      '<p>' + "Please upload an image." + '</p>' +
      '<button type="submit" id="uploadBtn">' + "OK" + '</button>' +
      '</div>';
         return false;
    }
}

   

function fileValidation2() {
    
  var fileInput2 = document.getElementById("file2");
  var filePath2 = fileInput2.value;
  var allowedExtensions2 = /(\.jpg|\.jpeg|\.png|\.pdf)$/i;

  if (!allowedExtensions2.exec(filePath2)) {

    alert("Please enter the image file only. etc. jpg,jpeg,png,pdf ");
    fileInput2.value = "";
    return false;
  } else {
    if (fileInput2.files && fileInput2.files[0]) {
      var file2 = fileInput2.files[0];
      var reader2 = new FileReader();
    
      reader2.onload = function (element2) {
        if (file2.type === 'application/pdf') {
          document.getElementById("imagePreview2").innerHTML =
            '<embed src="' + element2.target.result + '" width="800px" height="2100px" />';
        } else {
          document.getElementById("imagePreview2").innerHTML =
            '<img width="400px" height="600px" src="' + element2.target.result + '"/>';
        }
      };
    
      reader2.readAsDataURL(file2);
    }
  }    
  
}

function Checkimage2() {
    
    var previewImage = document.getElementById("imagePreview2");

    
    if (previewImage.querySelector("img") || previewImage.querySelector("embed")) {
      // alert("An image has been uploaded.");
        document.getElementById("Msgbyfile2").innerHTML =
        '<div class="texta" ' +
        '<h1>'+"Success!"+'</h1>'+
        '<p> ' + "An image has been uploaded." + '</p>'+
        '<button onclick="return okpopup();" type="submit">'+"OK."+'</button>' + 
        // '<button type="submit" >'+" OK" + '</button>'+
        '</div>' ;
        console.log("Pass.");
        return false;
        // return true;
        
    } else {
      document.getElementById("Msgbyfile2").innerHTML =
      '<div class="texta">' +
      '<h2>' + "Upload an image" + '</h2>' +
      '<p>' + "Please upload an image." + '</p>' +
      '<button type="submit" id="uploadBtn">' + "OK" + '</button>' +
      '</div>';
      
        // alert("Please upload an image.");
        return false;
    }
}   
