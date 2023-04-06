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
  console.log(dayOfWeek_intarr);
  $(document).ready(function () {
    $(".day_of_week").each(function (index) {
      let cellWeekday = dayOfWeek_arr[index % 7]; //セルの曜日を取得する
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
