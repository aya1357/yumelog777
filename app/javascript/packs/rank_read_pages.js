document.addEventListener("turbo:load", function () {
  $(document).ready(function () {
    let titles = [
      { name: "文字探求家", min: 0, max: 9 },
      { name: "文学の新米", min: 10, max: 49 },
      { name: "詩の旅人", min: 50, max: 99 },
      { name: "短編文学の冒険者", min: 100, max: 199 },
      { name: "中編文学の達人", min: 200, max: 499 },
      { name: "長編文学の勇者", min: 500, max: 749 },
      { name: "古典の鑑賞家", min: 750, max: 999 },
      { name: "ノンフィクションの解析者", min: 1000, max: 1499 },
      { name: "フィクションの夢追人", min: 1500, max: 1999 },
      { name: "ベストセラーの制覇者", min: 2000, max: 2999 },
      { name: "ファンタジーの魔術師", min: 3000, max: 3999 },
      { name: "SFの未来人", min: 4000, max: 4999 },
      { name: "ミステリーの探偵", min: 5000, max: 5999 },
      { name: "ロマンスの情緒家", min: 6000, max: 6999 },
      { name: "伝記の歴史家", min: 7000, max: 7999 },
      { name: "哲学の思索家", min: 8000, max: 8999 },
      { name: "歴史書の時空旅行者", min: 9000, max: 9999 },
      { name: "科学書の探究者", min: 10000, max: 11999 },
      { name: "文学の巨人", min: 12000, max: 15999 },
      { name: "伝説の書籍仙人", min: 16000 },
    ];
    let total_read_pages = parseInt($(".rank_total_read_pages").text(), 10);
    console.log(total_read_pages);

    let currentTitle = "";
    let nextTitleMax = 0;
    let remainingPages = 0;
    let currentTitleMin = 0;
    let currentTitleMax = 0;

    for (let i = 0; i < titles.length; i++) {
      if (
        total_read_pages >= titles[i].min &&
        total_read_pages <= titles[i].max
      ) {
        currentTitle = titles[i].name;
        currentTitleMin = titles[i].min;
        currentTitleMax = titles[i].max;
        if (i < titles.length - 1) {
          remainingPages = (currentTitleMax + 1) - total_read_pages;
        }
        break;
      }
    }

    $(".rank_log_title").text(currentTitle);
    $(".rank_log_remaining").text(remainingPages);

    // プログレスバーの更新
    let progress =
      ((total_read_pages - currentTitleMin) /
        (currentTitleMax - currentTitleMin)) *
      100;
    $(".rank_progress_bar")
      .css("width", progress + "%")
      .attr("aria-valuenow", progress);
  });
});
