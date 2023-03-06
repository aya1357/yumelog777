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

    p "テスト"
    p params[:log_id]
    @log.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Log.model_name.human), status: :see_other
  end

  private

  def log_collection_params
    params.require(:form_log_collection)
    .permit(logs_attributes: [:log_date, :study_number, :user_id, :study_id])
  end
end
