document.addEventListener("DOMContentLoaded", function() {
  const unreadMessages = document.querySelectorAll(".unread");
  const unread = document.getElementById("notifes");
  const markAll = document.getElementById("mark_all");
  unread.innerText = unreadMessages.length;

  unreadMessages.forEach((message) => {
    message.addEventListener("click", () => {
      message.classList.remove("unread");
      const newUnreadMessages = document.querySelectorAll(".unread");
      unread.innerText = newUnreadMessages.length;
    });
  });

  markAll.addEventListener("click", () => {
    unreadMessages.forEach((message) => message.classList.remove("unread"));
    const newUnreadMessages = document.querySelectorAll(".unread");
    unread.innerText = newUnreadMessages.length;
  });
 

});
document.getElementById('close_noti').addEventListener('click', function() {
    document.getElementById('popup_noti').style.display = 'none';
  });
  document.querySelector('.notification-icon').addEventListener('click', function() {
    document.getElementById('popup_noti').style.display = 'block';
  });
