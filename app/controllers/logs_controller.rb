class LogsController < ApplicationController
  before_action :check_guest, except: [:new]
  before_action :get_study, only: %i[new create edit]
  before_action :log_date_display, only: %i[new edit]

  def new
    @form = Form::LogCollection.new
  end

  def create
    @form = Form::LogCollection.new(log_collection_params)
    @log_date = params[:form_log_collection][:logs_attributes]["0"][:log_date]

    if params[:form_log_collection][:create_action_flag] && current_user.logs.where(log_date: @log_date).present?
      redirect_to "/calendars", alert: t('defaults.message.log_registered')
      return
    end

    if params[:form_log_collection][:log_date].present?
      @log_ids = current_user.logs.where(log_date: @log_date).pluck(:id)
    end

    if @form.save
      Log.where(id: @log_ids).destroy_all if @log_ids.present?
      redirect_to studies_log_date_path(date: @log_date), success: t('defaults.message.created', item: Log.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Log.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form = Form::LogCollection.new({}, current_user.id, params[:date])
  end

  def destroy
    @log = current_user.logs.where(log_date: params["date"]).where(study_id: params["id"])
    @log.update!(study_number: 0)
    redirect_to studies_log_date_path(date: params["date"]), success: t('defaults.message.reset', item: Log.model_name.human), status: :see_other
  end

  def destroy_all
    @logs = current_user.logs.where(log_date: params["date"])
    @logs.destroy_all
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Log.model_name.human), status: :see_other
  end

  def log_culc_api
    study = current_user.studies.find(params["study_id"])
    total_study_number = study.end_number - study.start_number
    total_studied_number = Log.where(user_id: current_user.id, study_id: params["study_id"]).pluck(:study_number).sum

    # 残りページ数を計算
    remain_number =  total_study_number.to_i - (total_studied_number.to_i + params["studied_pages"].to_i)
    if remain_number >= 0
      remain_number = remain_number
    else
      remain_number = 0
    end

    if remain_number == 0
      culc_end_day = today.strftime('%Y年%m月%d日')
    else
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
    end

    if remain_number == 0
      culc_end_day = today.strftime('%Y年%m月%d日')
    else
      culc_end_day = (today - 1).strftime('%Y年%m月%d日')
    end
    log = { culc_end_day: culc_end_day, remain_number: remain_number }
    render json: log
  end

  private

  def log_collection_params
    params.require(:form_log_collection)
    .permit(logs_attributes: [:log_date, :study_number, :user_id, :study_id])
  end

  def check_guest
    redirect_to calendars_path, warning: t('defaults.message.guest_login') if current_user.guest?
  end

  def get_study
    @studies = current_user.studies.order(created_at: :desc)
  end

  def log_date_display
    @log_date_display = Date.parse(params[:date]).strftime("%Y年%m月%d日")
  end

end
