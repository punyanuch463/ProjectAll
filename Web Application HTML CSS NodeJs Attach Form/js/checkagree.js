

// document.addEventListener("DOMContentLoaded", function() {
//     const checkbox = document.getElementById('Agree');
//     checkbox.addEventListener('change', function() {
//         if (checkbox.checked) {
//             console.log('Checkbox is checked');
//             window.location.href = '/homepage';
//         } else {
//             console.log('Checkbox is not checked');
//             window.location.href = '/login';
//         }
//     });
// });
const nextButton = document.getElementById('nextbtn');
    nextButton.addEventListener('click', function(event) {
        event.preventDefault(); // ป้องกันการทำงานของ form submit โดยปกติ

        const checkbox = document.getElementById('Agree');
        
        if (!checkbox.checked) {
            console.log('Please agree to the terms');
            alert('Please agree to the terms (นักศึกษา"ต้อง"ยินยอมก่อนถึงขั้นตอนต่อไปได้)');
            
        }

        
        else  {
        console.log('Checkbox is checked, Proceeding to next step...');
        window.location.href = '/homepage';
        }
    });
