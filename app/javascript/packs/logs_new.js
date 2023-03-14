document.addEventListener("turbo:load", function () {
  $('div[id^="calc_btn_"]').click(function (e) {
    e.preventDefault();
    let id_value = $(this).attr("id");
    console.log(id_value);
    let id_number = id_value.match(/\d+/);
    console.log(id_number);
    let study_id = parseInt(id_number[0]);
    console.log(study_id);
    let input_value = $("#input_"+ study_id).val();
    console.log(input_value);
  });
});
