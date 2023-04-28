class CalendarsController < ApplicationController
  def index
    @studies = current_user.studies.includes(:user).order(created_at: :desc)
    @logs = current_user.logs
    @log_date = current_user.logs.pluck(:log_date).uniq
    @todays_books = todays_books_titles(@studies)
  end

  def destroy
    @study = current_user.studies.find(params[:id])
    @study.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Study.model_name.human), status: :see_other
  end

  private

  #本を最初に登録した際の取り組む曜日に、本日の日付が含まれているかチェック
  def today_in_read_day_of_week(study)
    study_days = study.day_of_week.split(",").map(&:to_i).sort
    study_days.include?(Time.now.wday)
  end

  #今日の日付が取り組む曜日に含まれている本のタイトルを取得
  def todays_books_titles(studies)
    todays_books = studies.select { |study| today_in_read_day_of_week(study) && study.status == false }
    todays_books.map(&:title)
  end
end
