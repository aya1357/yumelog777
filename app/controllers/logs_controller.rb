class LogsController < ApplicationController
  before_action :check_guest, except: [:new]
  before_action :get_study, only: %i[new create edit]
  before_action :log_date_display, only: %i[new edit]
  include OgpImage

  def new
    @form = Form::LogCollection.new
    @date = params[:date] ? Date.parse(params[:date]) : Time.zone.today
  end

  def edit
    @form = Form::LogCollection.new({}, current_user.id, params[:date])
  end

  def create
    @form = Form::LogCollection.new(log_collection_params)
    @log_date = params[:form_log_collection][:logs_attributes]["0"][:log_date]

    if create_log_exist?
      redirect_to "/calendars", alert: t('defaults.message.log_registered')
      return
    end

    # params[:form_log_collection][:logs_attributes]から受け取った日付のログが、現在のユーザーのログの中にある場合、そのログのIDを取得
    log_ids = current_user.logs.where(log_date: @log_date).pluck(:id) if params.dig(:form_log_collection, :log_date).present?

    if @form.save
      Log.where(id: log_ids).destroy_all if log_ids.present?
      @log = @form.logs.first
      # redirect_to studies_log_date_path(date: @log_date), success: t('defaults.message.created', item: Log.model_name.human)
      redirect_to completed_log_path(id: @log.id), success: t('defaults.message.created', item: Log.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Log.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log = current_user.logs.where(log_date: params[:date]).where(study_id: params[:id])
    log.update!(study_number: 0)
    redirect_to studies_log_date_path(date: params[:date]), success: t('defaults.message.reset', item: Log.model_name.human), status: :see_other
  end

  def destroy_all
    logs = current_user.logs.where(log_date: params[:date])
    logs.destroy_all
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Log.model_name.human), status: :see_other
  end

  def log_culc_api
    study = current_user.studies.find(params[:study_id])
    remain_pages = study.remain_pages(current_user.id, params[:studied_pages])
    automatic_calculation_end_date = study.automatic_calculation_end_date(current_user.id, params[:studied_pages])
    log = { automatic_calculation_end_date: automatic_calculation_end_date, remain_pages: remain_pages }
    render json: log
  end

  def completed
    @log = Log.find(params[:id])
  end

  def image
    image = Log.character_card_img(params[:id])
    send_data image.to_blob, type: 'image/png', disposition: 'inline'
  end

  private

  def log_collection_params
    params.require(:form_log_collection)
    .permit(logs_attributes: [:log_date, :study_number, :user_id, :study_id])
  end

  def check_guest
    redirect_to new_user_path, warning: t('defaults.message.log_guest_login') if current_user.guest?
  end

  def get_study
    @studies = current_user.studies.order(created_at: :desc)
  end

  def log_date_display
    @date_display = params[:date] ? Date.parse(params[:date]) : Time.zone.today
  end

  def create_log_exist?
    params[:form_log_collection][:create_action_flag] && current_user.logs.where(log_date: @log_date).present?
  end
end
