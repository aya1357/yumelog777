document.addEventListener("turbo:load", function () {
  $(document).ready(function () {
    // 最初はすべてのアコーディオンコンテンツを非表示にする
    $(
      ".form_not_read_titles, .endDate_not_read_titles, .remainPages_not_read_titles, .targetPages_not_read_titles"
    ).hide();
    $(
      ".form_not_read_open, .endDate_not_read_open, .remainPages_not_read_open, .targetPages_not_read_open"
    ).hide();

    // アコーディオンタイトルがクリックされたときの動作
    $(
      ".form_not_read_index_title, .endDate_not_read_index_title, .remainPages_not_read_index_title, .targetPages_not_read_index_title"
    ).click(function () {
      toggleAllAccordions();
    });

    function toggleAllAccordions() {
      // すべてのアコーディオンコンテンツを開閉する
      $(
        ".form_not_read_titles, .endDate_not_read_titles, .remainPages_not_read_titles, .targetPages_not_read_titles"
      ).slideToggle(200);

      // すべてのアコーディオンの開閉アイコンを交換する
      $(
        ".form_not_read_open, .endDate_not_read_open, .remainPages_not_read_open, .targetPages_not_read_open"
      ).toggle();
      $(
        ".form_not_read_close, .endDate_not_read_close, .remainPages_not_read_close, .targetPages_not_read_close"
      ).toggle();
    }
  });
});
