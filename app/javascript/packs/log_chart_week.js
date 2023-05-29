let weekSet = 0;

document.addEventListener("turbo:load", function () {
  $("#previous_week, #next_week, #current_week").on("click", function (e) {
    e.preventDefault();
    let weekButton = $(this);

    // '先週'リンクのURLを更新
    if (weekButton.attr("id") === "previous_week") {
      weekSet -= 1;
    }
    // '翌週'リンクのURLを更新
    else if (weekButton.attr("id") === "next_week") {
      weekSet += 1;
    }
    // '今週'リンクのURLを更新
    else if (weekButton.attr("id") === "current_week") {
      weekSet = 0;
    }

    let currentDate = new Date();
    // getDate(現在の日付)からgetDay(曜日)を引くことで、今週の日曜日の日付を取得
    currentDate.setDate(
      currentDate.getDate() - currentDate.getDay() + 7 * weekSet
    );
    // 調整された日付をYYYY-MM-DD形式の文字列に変換
    let newStartDate = currentDate.toISOString().slice(0, 10);

    // リンクのURLを更新
    let newUrl = "/log_chart?week_start_date=" + newStartDate;
    weekButton.attr("href", newUrl);

    // 新しいURLを使ってJSONデータを取得し、グラフを更新
    $.getJSON(newUrl, function (data) {
      Chartkick.charts["weekChart"].updateData(data);
    });
  });
});
