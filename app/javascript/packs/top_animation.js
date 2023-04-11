document.addEventListener("turbo:load", function () {
  $(window).scroll(function () {
    $(".top_content_img").each(function () {
      let elemPos = $(this).offset().top;
      let scroll = $(window).scrollTop();
      let windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight + 200) {
        $(this).addClass("scrollin");
      }
    });
  });
  $(window).scroll(function () {
    $(".top_content_text").each(function () {
      var targetElement = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > targetElement - windowHeight + 200) {
        $(this).css("opacity", "1");
        $(this).css("transform", "translateY(0)");
      }
    });
  });
  $(window).scroll(function () {
    $(".top_message").each(function () {
      var elemPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      //要素がスクロール位置まできたら
      if (scroll >= elemPos - windowHeight) {
        //クラス付与
        $(this).addClass("slideAnimeLeftRight");
        $(this).children(".top_message_inner").addClass("slideAnimeRightLeft");
      } else {
        //クラス削除
        $(this).removeClass("slideAnimeLeftRight");
        $(this).children(".top_message_inner").removeClass("slideAnimeRightLeft");
      }
    });
  });
});
