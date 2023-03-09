document.addEventListener("turbo:load", function () {
  $('div[id^="calc_btn_"]').click(function (e) {
    e.preventDefault();
    let id_value = $(this).attr("id");
    let id_number = id_value.match(/\d+/);
    let study_id = parseInt(id_number[0]);
    console.log(study_id);
    let input_value = $("#input_" + study_id).val();
    console.log(input_value);

    $.ajax({
      url: "logs/log_culc_api",
      type: "GET",
      data: { studied_pages: input_value, study_id: study_id },
    }).done(function (data) {
      console.log(data.remain_number);
      console.log(data.culc_end_day);
      $("#remainPages_" + study_id).text(data.remain_number);
      $("#remainPages_" + study_id).css("color", "#2563eb");
      $("#culcEndDay_" + study_id).text(data.culc_end_day);
      $("#culcEndDay_" + study_id).css("color", "#2563eb");
    });
  });
});
