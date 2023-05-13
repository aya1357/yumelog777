document.addEventListener("turbo:load", function () {
  $(document).ready(function () {
    $(".calendar_book_index_dropdown").hover(
      function () {
        $(this)
          .find(".calendar_book_index_dropdown-content")
          .stop(true, true)
          .delay(200)
          .fadeIn(500);
      },
      function () {
        $(this)
          .find(".calendar_book_index_dropdown-content")
          .stop(true, true)
          .delay(200)
          .fadeOut(500);
      }
    );
  });
});
