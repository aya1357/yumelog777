document.addEventListener("turbo:load", function () {
  $('div[id^="calc_btn_"]').click(function (e) {
    e.preventDefault();
    let id_value = $(this).attr("id");
    let id_number = id_value.match(/\d+/);
    let study_id = parseInt(id_number[0]);
    let input_value = $("#input_" + study_id).val();

    $.ajax({
      url: "logs/log_culc_api",
      type: "GET",
      data: { studied_pages: input_value, study_id: study_id },
    }).done(function (data) {
      // 日付文字列をDateオブジェクトに変換
      let endDate = new Date(data.automatic_calculation_end_date);

      // 年月日の値を取得
      let year = endDate.getFullYear();
      let month = endDate.getMonth() + 1; // JavaScriptの月は0から始まるため、1を加算する必要があります
      let date = endDate.getDate();

      // 曜日の値を取得
      let weekdays = ["日", "月", "火", "水", "木", "金", "土"];
      let weekday = weekdays[endDate.getDay()];

      // i18nフォーマットに変換
      let automatic_calculation_end_date =
        year +
        "年" +
        ("0" + month).slice(-2) +
        "月" +
        ("0" + date).slice(-2) +
        "日(" +
        weekday +
        ")";

      $("#remainPages_" + study_id)
        .text(data.remain_pages)
        .css("color", "#2563eb");
      $("#culcEndDay_" + study_id)
        .text(automatic_calculation_end_date)
        .css("color", "#2563eb");
    });
  });
});
