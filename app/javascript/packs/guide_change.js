document.addEventListener("turbo:load", function () {
  $(".log_guide").hide();
  $("#log_guide_btn").click(function () {
    $(".log_guide").show();
    $(".book_guide").hide();
    $(this)
      .removeClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      )
      .addClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      );
    $("#book_guide_btn")
      .removeClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      )
      .addClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      );
  });
  $("#book_guide_btn").click(function () {
    $(".book_guide").show();
    $(".log_guide").hide();
    $(this)
      .removeClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      )
      .addClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      );
    $("#log_guide_btn")
      .removeClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      )
      .addClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      );
  });
});
