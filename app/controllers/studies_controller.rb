class StudiesController < ApplicationController
  def index
    @studies = Study.all.includes(:user).order(created_at: :desc)
  end

  def new
    @study = Study.new
  end

  def create
    @study = current_user.studies.build(study_params)
    if @study.save
      redirect_to calendars_path, success: t('defaults.message.created', item: Study.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Study.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @study = current_user.studies.find(params[:id])
  end

  def edit
    @study = current_user.studies.find(params[:id])
  end

  def update
    @study = current_user.studies.find(params[:id])
    if @study.update(study_params)
      redirect_to calendars_path, success: t('defaults.message.updated', item: Study.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Study.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @study = current_user.studies.find(params[:id])
    @study.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Study.model_name.human), status: :see_other
  end

  def log_date
    @studies = Study.all.includes(:user).order(created_at: :desc)
    @logs = Log.where(user_id: current_user.id).where(log_date: params["date"])
    log_date = Date.parse(params["date"])
    @formatted_date = log_date.strftime("%Y年%m月%d日")
  end

  def log_date_api
    @log = Log.where(user_id: current_user.id).where(log_date: params["date"])
    #logs(勉強の記録)が無い場合はstatus: 0, logs(勉強の記録)がある場合はstatus: 1を設定
    status = @log.empty? ? 0 : 1
    render json: { status: status, data: @log }
  end

  private

  def study_params
    params.require(:study).permit(:title, :total_number, :start_number, :end_number, :target_number, :url, :start_day, :day_of_week)
  end
end
