function sendMail() {
    var params = {
      name : document.getElementById("name").value ,
      id : document.getElementById("id").value ,
      subject: document.getElementById("subject").value,
      email: document.getElementById("email").value,
      message: document.getElementById("message").value,
    };
  
    const serviceID = "service_mdxtc7i";
    const templateID = "template_w44geci";
  
      emailjs.send(serviceID, templateID, params)
      .then(res=>{
        document.getElementById("name").value = "";
        document.getElementById("id").value = "";
          document.getElementById("subject").value = "";
          document.getElementById("email").value = "";
          document.getElementById("message").value = "";
          console.log(res);
          alert("Your message sent successfully!!")
  
      })
      .catch(err=>console.log(err));
  
  }