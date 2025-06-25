document.addEventListener("DOMContentLoaded", function() {
  // เช่น เพิ่ม event listener สำหรับปุ่ม Login
  const loginButton = document.querySelector('.btn-primary');
  loginButton.addEventListener('click', function(event) {
    event.preventDefault(); // ป้องกันการทำงานของ form submit โดยปกติ
    
    // ดึงค่าจาก input fields
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const role = document.getElementById('role').value.toLowerCase();


    // ตรวจสอบค่าที่กรอกเข้ามา
    if (username.trim() === '' || password.trim() === '' || role.trim() === '') {
      alert('กรุณากรอกข้อมูลให้ครบทุกช่อง');
      return;
    }

    if (username.endsWith('@student.mahidol.ac.th')  && role === 'student' ) {

      window.location.href = '/pdpa'; 
    }
    else if (username.endsWith('@mahidol.ac.th')  && role === 'admin') {

      window.location.href = '/Approve'; //เปลี่ยน Path ที่จะไปหน้า Admin ที่นี้
    }
    else if (username != username.endsWith('@student.mahidol.ac.th')  && role === 'student'   ){

      alert('กรุณากรอกอีเมล ( student.mahidol.ac.th )');
    }
    else if (username != username.endsWith('@mahidol.ac.th')  && role === 'admin'   ){

alert('กรุณากรอกอีเมล ( mahidol.ac.th )');
}
else {

    alert('ข้อมูลเข้าสู่ระบบไม่ถูกต้อง');
}
  });
});