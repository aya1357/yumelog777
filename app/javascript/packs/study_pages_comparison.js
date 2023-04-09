document.addEventListener("turbo:load", function () {
  $("form").submit(function (event) {
    // フォームの送信を一旦止める
    event.preventDefault();

    let total_pages = parseInt($("#total_pages").val());
    let start_page = parseInt($("#start_page").val());
    let end_page = parseInt($("#end_page").val());
    let target_pages = parseInt($("#target_pages").val());

    if (end_page > total_pages) {
      // エラーメッセージを表示する処理
      alert("読み終えるページ数は総ページ数以下に設定してください。");
      return false;
    } else if (start_page > end_page) {
      // エラーメッセージを表示する処理
      alert("読み始めるページ数は読み終えるページ数以下に設定してください。");
      return false;
    } else if (target_pages > end_page && target_pages > total_pages) {
      // エラーメッセージを表示する処理
      alert("1日に取り組むページ数は読み終えるページ数、または総ページ数以下に設定してください。");
      return false;
    } else {
      // バリデーションに成功した場合、フォームを送信する
      this.submit();
    };
  });
});
