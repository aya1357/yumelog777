document.addEventListener("turbo:load", function () {
  $(document).ready(function () {
    $("#previous_week, #next_week, #current_week").on("click", function (e) {
      e.preventDefault();
      let $this = $(this); // リンク自体を参照
      let url = $this.attr("href");

      $.getJSON(url, function (data) {
        Chartkick.charts["weekChart"].updateData(data);

        // '先週'リンクのURLを更新
        if ($this.attr("id") === "previous_week") {
          $this.attr(
            "href",
            url.replace(/start_date=(\d+-\d+-\d+)/, function (_, date) {
              let newDate = new Date(date);
              newDate.setDate(newDate.getDate() - 7);
              return "start_date=" + newDate.toISOString().slice(0, 10);
            })
          );
        }
        // '翌週'リンクのURLを更新
        else {
          $this.attr(
            "href",
            url.replace(/start_date=(\d+-\d+-\d+)/, function (_, date) {
              let newDate = new Date(date);
              newDate.setDate(newDate.getDate() + 7);
              return "start_date=" + newDate.toISOString().slice(0, 10);
            })
          );
        }
      });
    });
  });
});
