window.addEventListener('DOMContentLoaded', function(){
  /** jQueryの処理 */
  // $("#button1").click(function(){
  //   const str1 = $("#hidden1").val();
  //   $("#span1").text(str1);
  // });
  $("#dayOfWeek0").click(function(){
    $(this).toggleClass("hid bg-gray-50 text-blue-700 bg-blue-600 text-slate-50");
    console.log($(this).hasClass("hid"));
    if ($(this).hasClass("hid")) {
      $("#hidden2").val("0");
      $("#span1").text($("#hidden2").val(""));
    } else {
      $("#hidden2").val("");
      $("#span1").text("");
    };
  });

});
