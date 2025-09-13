
const btn = document.getElementById("menu-btn");
const sidebar = document.getElementById("sidebar");

btn.addEventListener("click", function () {
      // bascule la classe active
    sidebar.classList.toggle("active");

      // change le texte du bouton
    // if (btn.classList.contains("active")) {
    //     btn.textContent = "ON";
    //   } else {
    //     btn.textContent = "OFF";
    //   }
});
