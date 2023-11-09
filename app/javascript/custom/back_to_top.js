document.addEventListener('turbo:load', function () {
  var backToTopButton = document.getElementById('back-to-top');

  if (backToTopButton) {
    window.onscroll = function () {
      if (window.scrollY > 300) { // 'scrollY'を使用
        backToTopButton.style.display = "block";
      } else {
        backToTopButton.style.display = "none";
      }
    };

    backToTopButton.onclick = function () {
      window.scrollTo(0, 0);
    };
  }
});
