document.addEventListener("turbo:load", function () {
  // 進捗率を取得
  let progressBars = document.querySelectorAll(".progress-bar");
  let progressTexts = document.querySelectorAll(".progress-text");

  progressBars.forEach((progressBar, index) => {
    // 進捗率をdata-progress属性から取得
    let progress = progressBar.dataset.progress;

    // 進捗バーの幅を更新
    progressBar.style.width = progress + "%";

    // 進捗バーのテキストを更新
    progressTexts[index].textContent = progress + "%";
  });
});
