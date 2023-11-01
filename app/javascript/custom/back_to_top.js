document.addEventListener('DOMContentLoaded', function () {
  var backToTopButton = document.getElementById('back-to-top');

  window.onscroll = function () {
      if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
          backToTopButton.style.display = "block";
      } else {
          backToTopButton.style.display = "none";
      }
  };

  backToTopButton.onclick = function () {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
  };
});

