//////////// When the user scrolls down 80px from the top of the document, resize the navbar's padding and the logo's font size
window.onscroll = function () {
  scrollFunction();
};

console.log("##### custom.js loaded");

function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("mainNav").style.padding = "10px 10px";
    document.getElementById("logo").style.fontSize = "25px";
  } else {
    document.getElementById("mainNav").style.padding = "18px 10px";
    document.getElementById("logo").style.fontSize = "35px";
  }
}
