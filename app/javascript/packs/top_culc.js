document.addEventListener("turbo:load", function () {
  $("#top_input_left_total_pages").on("change", function () {
    if ($("#top_input_left_total_pages").val() <= 0) {
      // 総ページ数の箇所にもし0以下の値が入力された場合1に置き換える
      $("#top_input_left_total_pages").val(1);
    }
  });
  $("#top_input_right_total_pages").on("change", function () {
    if ($("#top_input_right_total_pages").val() <= 0) {
      // 総ページ数の箇所にもし0以下の値が入力された場合1に置き換える
      $("#top_input_right_total_pages").val(1);
    }
  });
  $("#input_target_pages").on("change", function () {
    if ($("#input_target_pages").val() <= 0) {
      // 1日の目標ページ数n箇所にもし0以下の値が入力された場合1に置き換える
      $("#input_target_pages").val(1);
    }
  });
  $("#top_left_culc_btn").click(function () {
    // フォームのバリデーション
    let form = $(this).closest("form")[0];
    if (!form.checkValidity()) {
      // バリデーションに失敗した場合、デフォルトのバリデーションメッセージを表示して終了
      form.reportValidity();
      return;
    }
    let total_pages = $("#top_input_left_total_pages").val();
    let target_pages = $("#input_target_pages").val();
    //勉強日数を計算(総ページ数 / 1日の目標ページ数が整数でない場合は、その値を切り上げる。)
    if (Number.isInteger(total_pages / target_pages)) {
      study_days = total_pages / target_pages - 1;
    } else {
      study_days = Math.ceil(total_pages / target_pages) - 1;
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
    document.getElementById("end_date").innerHTML =
      "終了予定日は、" + formatted_end_date + "です。";
  });

  // 今日の日付以前の日付を選択できないようにする
  $(document).ready(function () {
    let today = new Date().toISOString().split("T")[0];
    $("#top_input_date").attr("min", today);
  });

  $("#top_right_culc_btn").click(function () {
    // フォームのバリデーション
    let form = $(this).closest("form")[0];
    if (!form.checkValidity()) {
      // バリデーションに失敗した場合、デフォルトのバリデーションメッセージを表示して終了
      form.reportValidity();
      return;
    }

    let right_total_pages = $("#top_input_right_total_pages").val();
    let target_finish_date = $("#top_input_date").val();
    // 今日の日付を取得
    let today = new Date();
    today.setHours(0, 0, 0, 0); // 時間、分、秒、ミリ秒をゼロに設定して日付のみを比較できるようにします

    // 目標の完了日をDateオブジェクトに変換
    let target_date = new Date(target_finish_date);

    // 両者の日付の差をミリ秒単位で計算
    let diff_in_ms = target_date - today;

    // ミリ秒単位の差を日単位に変換して、今日の日付から入力された日付までの日数を計算
    let read_days_count = Math.ceil(diff_in_ms / (1000 * 60 * 60 * 24));

    // 1日の目標ページ数を計算
    let target_pages = Math.ceil(right_total_pages / read_days_count);
    console.log(target_pages);
    ;

    //1日の目標ページ数をビューで表示
    document.getElementById("top_target_pages").innerHTML =
      "1日の目標ページ数は、約" + target_pages + "ページです。";
  });
});
