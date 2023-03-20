document.addEventListener("turbo:load", function () {
  $(".done").hide();
  $("#done-btn").click(function () {
    $(".done").show();
    $(".notDone").hide();
    $(this)
      .removeClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      )
      .addClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      );
    $("#notDone-btn")
      .removeClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      )
      .addClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      );
  });
  $("#notDone-btn").click(function () {
    $(".notDone").show();
    $(".done").hide();
    $(this)
      .removeClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      )
      .addClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      );
    $("#done-btn")
      .removeClass(
        "text-gray-700 px-6 block hover:text-blue-500 focus:outline-none border-b-2 font-extrabold text-2xl border-blue-500"
      )
      .addClass(
        "text-gray-600 px-6 block hover:text-blue-500 focus:outline-none"
      );
  });
});
