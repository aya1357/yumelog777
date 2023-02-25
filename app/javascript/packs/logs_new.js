document.addEventListener("turbo:load", function () {
  $('div[id^="calc_btn_"]').click(function (e) {
    e.preventDefault();
    let id_value = $(this).attr("id");
    let id_number = id_value.match(/\d+/);
    let study_id = parseInt(id_number[0]);
    let input_value = $("#input_"+ study_id).val();
  });
});
