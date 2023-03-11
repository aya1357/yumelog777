class LogsController < ApplicationController
  def new
    @form = Form::LogCollection.new
    @studies = Study.all.includes(:user).order(created_at: :desc)
    log_date = Date.parse(params["date"])
    @formatted_date = log_date.strftime("%Y年%m月%d日")
  end

  def create
    @studies = Study.all.includes(:user).order(created_at: :desc)
    @form = Form::LogCollection.new(log_collection_params)
    if params[:form_log_collection][:log_date].present?
			@log_ids = Log.where(user_id: current_user.id, log_date: params[:form_log_collection][:log_date]).pluck(:id)
		end
    if @form.save
      if @log_ids.present?
				@log_ids.each do |log_id|
					log = Log.find log_id
					log.destroy
				end
			end
      redirect_to calendars_path, success: t('defaults.message.created', item: Log.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Log.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @studies = Study.all.includes(:user).order(created_at: :desc)
    log_date = Date.parse(params[:date])
    @formatted_date = log_date.strftime("%Y年%m月%d日")
    @form = Form::LogCollection.new({}, current_user.id, params[:date])
  end

  def destroy
    @log = current_user.logs.find(params[:id])
    @log.update!(study_number: 0)
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Log.model_name.human), status: :see_other
  end

  def log_culc_api
    study = current_user.studies.find(params["study_id"])
    total_study_number = study.end_number - study.start_number
    total_studied_number = Log.where(user_id: current_user.id, study_id: params["study_id"]).pluck(:study_number).sum

    # 残りページ数を計算
    remain_number =  total_study_number.to_i - (total_studied_number.to_i + params["studied_pages"].to_i)

    # 自動計算終了日を計算
    dayOfWeek_arr = study.day_of_week.split(",").map(&:to_i).sort
    remain_study_days = remain_number % study.target_number == 0 ? remain_number / study.target_number : (remain_number.to_f / study.target_number.to_f).ceil
    today = Date.today
    while remain_study_days >= 1
      if dayOfWeek_arr.include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    culc_end_day = (today - 1).strftime('%Y年%m月%d日')
    p culc_end_day
    log = { culc_end_day: culc_end_day, remain_number: remain_number }
    render json: log
  end

  private

  def log_collection_params
    params.require(:form_log_collection)
    .permit(logs_attributes: [:log_date, :study_number, :user_id, :study_id])
  end
end
