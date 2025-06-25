function newaddress() {
  // เรียกดึงข้อมูลจากฟอร์ม
  var no = document.getElementById("no").value;
  var village = document.getElementById("village").value;
  var moo = document.getElementById("moo").value;
  var soi = document.getElementById("soi").value;
  var street = document.getElementById("street").value;
  var subdistrict = document.getElementById("subdistrict").value;
  var district = document.getElementById("district").value;
  var province = document.getElementById("province").value;
  var zipcode = document.getElementById("zipcode").value;

  // เงื่อนไขสำหรับตรวจสอบความเหมาะสมของตัวอักษร
  var isValid = true;

  // ตรวจสอบความเหมาะสมของตัวเลขที่ไม่สามารถเป็นตัวอักษรได้
  if (isNaN(no)) {
      alert("Please enter a valid number for No.");
      isValid = false;
  }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่อหมู่บ้านหรือคอนโด
  if (!validateName(village)) {
      alert("Please enter a valid name for Village / Condo.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่อหมู่บ้านหรือคอนโด
  function validateName(name) {
      // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
      return /^[a-zA-Zก-๏\s]+$/.test(name);
  }

  // ตรวจสอบความเหมาะสมของตัวเลขที่ไม่สามารถเป็นตัวอักษรได้
  if (isNaN(moo)) {
      alert("Please enter a valid number for Moo.");
      isValid = false;
  }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่อซอย
  if (!validateName(soi)) {
      alert("Please enter a valid name for Soi.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่อซอย
//   function validateName(name) {
//       // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
//       return /^[a-zA-Zก-๏\s]+$/.test(name);
//   }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่อถนน
  if (!validateName(street)) {
      alert("Please enter a valid name for Street.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่อถนน
//   function validateName(name) {
//       // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
//       return /^[a-zA-Zก-๏\s]+$/.test(name);
//   }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่อตำบลหรือแขวง
  if (!validateName(subdistrict)) {
      alert("Please enter a valid name for Sub-district.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่อตำบลหรือแขวง
  function validateName(name) {
      // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
      return /^[a-zA-Zก-๏\s]+$/.test(name);
  }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่ออำเภอหรือเขต
  if (!validateName(district)) {
      alert("Please enter a valid name for District.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่ออำเภอหรือเขต
//   function validateName(name) {
//       // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
//       return /^[a-zA-Zก-๏\s]+$/.test(name);
//   }

  // ตรวจสอบความเหมาะสมของตัวอักษรในชื่อจังหวัด
  if (!validateName(province)) {
      alert("Please enter a valid name for Province.");
      isValid = false;
  }

  // ฟังก์ชันที่ใช้ในการตรวจสอบความเหมาะสมของตัวอักษรในชื่อจังหวัด
//   function validateName(name) {
//       // ตรวจสอบว่าชื่อมีตัวอักษรที่ไม่ใช่ตัวเลขหรืออักขระพิเศษหรือไม่
//       return /^[a-zA-Zก-๏\s]+$/.test(name);
//   }

  // ตรวจสอบความเหมาะสมของรหัสไปรษณีย์
  if (isNaN(zipcode) || zipcode.length !== 5) {
      alert("Please enter a valid 5-digit Zipcode.");
      isValid = false;
  }

  // ส่งค่าความเหมาะสมกลับ
  return isValid;
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




