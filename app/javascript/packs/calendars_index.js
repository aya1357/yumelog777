document.addEventListener("turbo:load", function () {
  $(".table tbody tr td a").click(function() {
    //カレンダーでクリックした箇所の日付の数字を取り出す
    const log_date_text = $(this).text();
    const log_date_num = log_date_text.replace(/[^0-9]/g, '');
    const log_date = (log_date_num < 10) ? '0' + log_date_num : log_date_num;

    //カレンダーでクリックした箇所の日付の月の数字を取り出す
    const log_month_text = $(".calendar-title").text();
    const log_month_num = log_month_text.replace(/[^0-9]/g, '');
    const log_year = log_month_num.substr( 0, 4 );
    const log_mon = log_month_num.substr( 4 );
    const log_month = ( log_mon < 10 ) ? '0' + log_mon : log_mon;
    const log_year_month_date = "" + log_year + log_month + log_date;
    console.log(log_year_month_date);
    window.location.href = '/habits/log_date';
    $.ajax({
      url: 'habits/log_date_api?date='+log_year_month_date,
      type: 'GET',
    });

  });
});
