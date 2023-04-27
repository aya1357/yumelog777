document.addEventListener("turbo:load", function () {
  $(document).ready(function () {
    // 最初はすべてのアコーディオンコンテンツを非表示にする
    $(".books_titles").hide();
    $(".books_index_open").hide();

    // アコーディオンタイトルがクリックされたときの動作
    $(".accordion_books_index_title").click(function () {
      // クリックされたタイトルのアコーディオンコンテンツを開閉する
      $(this).next(".books_titles").slideToggle(200);

      // クリックされたタイトルの開閉アイコンを交換する
      $(this).find(".books_index_open").toggle();
      $(this).find(".books_index_close").toggle();

      // 他のアコーディオンコンテンツを閉じる
      $(".books_titles").not($(this).next(".books_titles")).slideUp(200);

      // 他のアコーディオンタイトルの開閉アイコンをリセットする
      $(".accordion_books_index_title")
        .not($(this))
        .find(".books_index_open")
        .hide();
      $(".accordion_books_index_title")
        .not($(this))
        .find(".books_index_close")
        .show();
    });
  });
});
