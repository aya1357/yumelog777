class LogsController < ApplicationController
  def index
    @study = current_user.studies.find(params[:study_id])
  end

  def new
    @log = Log.new
    @studies = Study.all.includes(:user).order(created_at: :desc)
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      redirect_to calendars_path, success: t('defaults.message.created', item: Log.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Log.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit(:log_date, :study_number)
  end
end
