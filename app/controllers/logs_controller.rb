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
    if @form.save
      redirect_to calendars_path, success: t('defaults.message.created', item: Log.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Log.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def log_collection_params
    params.require(:form_log_collection)
    .permit(logs_attributes: [:log_date, :study_number, :user_id, :study_id])
    # .merge(user_id: current_user.id, study_id: params[:study_id])
  end
end
