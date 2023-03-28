document.addEventListener("turbo:load", function () {
  $("#input_total_pages").on("change", function () {
    if ($("#input_total_pages").val() <= 0) {
      // 総ページ数の箇所にもし0以下の値が入力された場合
      $("#input_total_pages").val(1); // 1に置き換える
    }
  });
  $("#input_target_pages").on("change", function () {
    if ($("#input_target_pages").val() <= 0) {
      // 1日の目標ページ数n箇所にもし0以下の値が入力された場合
      $("#input_target_pages").val(1); // 1に置き換える
    }
  });
  $("#start_culc_btn").click(function (e) {
    e.preventDefault();
    let total_number = $("#input_total_pages").val();
    let target_number = $("#input_target_pages").val();
    //勉強日数を計算(総ページ数 / 1日の目標ページ数が整数でない場合は、その値を切り上げる。)
    if (Number.isInteger(total_number / target_number)) {
      study_days = total_number / target_number;
    } else {
      study_days = Math.ceil(total_number / target_number);
    }

    //計算した勉強日数を元に終了日時を計算
    let today = new Date();
    let end_day = new Date(today.getTime() + study_days * 24 * 60 * 60 * 1000);

    //日付の表示形式を変更
    let year = end_day.getFullYear();
    let month = ("0" + (end_day.getMonth() + 1)).slice(-2);
    let day = ("0" + end_day.getDate()).slice(-2);
    let formatted_end_date = year + "年" + month + "月" + day + "日";

    //終了日時をビューで表示
    document.getElementById("end_date").innerHTML = "終了予定日は、" + formatted_end_date + "です。";
  });
});
