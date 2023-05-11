document.addEventListener("turbo:load", function () {
  //曜日選択の際に、既に設定されている曜日を数値として取得して数字の配列を作成
  let dayOfWeek_arr =
    $("#dayOfWeek_checked").length > 0
      ? $("#dayOfWeek_checked")
          .val()
          .split(",")
          .sort(function (a, b) {
            return a - b;
          })
      : undefined;
  //文字列の配列を数字の配列に変換
  let dayOfWeek_intarr = dayOfWeek_arr
    ? dayOfWeek_arr.map(function (str) {
        return parseInt(str, 10);
      })
    : undefined;
  $(document).ready(function () {
    $(".day_of_week").each(function (index) {
      //セルの曜日を取得する
      let cellWeekday = dayOfWeek_arr[index % 7];
      if (dayOfWeek_intarr.includes(index % 7)) {
        //セルの曜日がdayOfWeek_intarrに含まれる場合、背景色選択されている際の色に設定
        $(this).toggleClass(
          "checked bg-gray-50 text-blue-700 border-blue-500 bg-blue-700 text-slate-50 border-blue-700"
        );
      }
    });
  });

  $(".day_of_week").click(function () {
    let week_value = check_week_value($(this).val());

    $(this).toggleClass(
      "checked bg-gray-50 text-blue-700 border-blue-500 bg-blue-700 text-slate-50 border-blue-700"
    );

    if ($(this).hasClass("checked")) {
      let current_value = $("#dayOfWeek_checked").val();
      // クリックしてclassが存在するとき
      if (current_value != "") {
        // 値が設定されている場合(ex.0がhidden_fieldに設定済みの場合. [0] ⇨ [0,1] ⇨ 0,1)
        let split_value = current_value.split(",");
        split_value.push(week_value);
        let new_value = split_value.join(",");
        $("#dayOfWeek_checked").val(new_value);
      } else {
        // 値が設定されていない場合
        $("#dayOfWeek_checked").val(week_value);
      }
    } else {
      let current_value = $("#dayOfWeek_checked").val();
      if (current_value != "") {
        // 値が存在する時
        let split_value = current_value.split(",");
        if (split_value.includes(week_value)) {
          let index = split_value.indexOf(week_value);
          split_value.splice(index, 1);
          let new_value = split_value.join(",");
          $("#dayOfWeek_checked").val(new_value);
        }
      }
    }
  });

  const weekdayValues = ["1", "2", "3", "4", "5"];
  const holidayValues = ["0", "6"];

  // 平日ボタンがクリックされたときの処理
  $(".edit_mainWeekday").click(function () {
    // 平日ボタンのクラスを切り替える
    $(".edit_weekday").toggleClass(
      "checked bg-gray-50 text-blue-700 border-blue-500 bg-blue-700 text-slate-50 border-blue-700"
    );
    // 現在の選択値を取得
    let current_value = $("#dayOfWeek_checked")
      .val()
      .split(",")
      .filter(Boolean);
    // 選択されているボタンがある場合
    if ($(this).hasClass("checked")) {
      // 選択されているボタンのCSSとvalue解除
      $(this).removeClass("checked");
      $(".edit_weekday")
        .removeClass("checked bg-blue-700 text-slate-50 border-blue-700")
        .addClass("bg-gray-50 text-blue-700 border-blue-500");
      // 現在の選択から平日の値を削除した配列を作成
      current_value = current_value.filter(
        (value) => !weekdayValues.includes(value)
      );
    } else {
      // 選択されているボタンがない場合
      $(this).addClass("checked");
      $(".edit_weekday")
        .addClass("checked bg-blue-700 text-slate-50 border-blue-700")
        .removeClass("bg-gray-50 text-blue-700 border-blue-500");
      // 現在の選択に平日の値を追加します
      current_value = [...new Set([...current_value, ...weekdayValues])];
    }
    $("#dayOfWeek_checked").val(current_value.join(","));
  });

  // 休日ボタンがクリックされたときの処理
  $(".edit_mainHoliday").click(function () {
    $(".holiday").toggleClass(
      "checked bg-gray-50 text-blue-700 border-blue-500 bg-blue-700 text-slate-50 border-blue-700"
    );
    // 現在の選択値を取得
    let current_value = $("#dayOfWeek_checked")
      .val()
      .split(",")
      .filter(Boolean);
    // 選択されているボタンがある場合
    if ($(this).hasClass("checked")) {
      // 選択されているボタンのCSSとvalue解除
      $(this).removeClass("checked");
      $(".edit_holiday")
        .removeClass("checked bg-blue-700 text-slate-50 border-blue-700")
        .addClass("bg-gray-50 text-blue-700 border-blue-500");
      // 現在の選択から休日の値を削除した配列を作成
      current_value = current_value.filter(
        (value) => !holidayValues.includes(value)
      );
    } else {
      // 選択されているボタンがない場合
      $(this).addClass("checked");
      $(".edit_holiday")
        .addClass("checked bg-blue-700 text-slate-50 border-blue-700")
        .removeClass("bg-gray-50 text-blue-700 border-blue-500");
      // 現在の選択に休日の値を追加
      current_value = [...new Set([...current_value, ...holidayValues])];
    }
    $("#dayOfWeek_checked").val(current_value.join(","));
  });

  function check_week_value(checked_week_value) {
    switch (checked_week_value) {
      case "日":
        week_value = "0";
        break;
      case "月":
        week_value = "1";
        break;
      case "火":
        week_value = "2";
        break;
      case "水":
        week_value = "3";
        break;
      case "木":
        week_value = "4";
        break;
      case "金":
        week_value = "5";
        break;
      case "土":
        week_value = "6";
        break;
      default:
        week_value = "";
        break;
    }
    return week_value;
  }
});
