class StudiesController < ApplicationController

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
    @studies = current_user.studies.order(created_at: :desc)
    @logs = current_user.logs.where(log_date: params["date"])
    log_date = Date.parse(params["date"])
    @formatted_date = log_date.strftime("%Y年%m月%d日")
    study_number = Log.where(user_id: current_user.id).where(log_date: params["date"]).pluck(:study_number)
    if study_number.all? {|x| x == 0 }
      redirect_to calendars_path, success: t('defaults.message.deleted', item: Log.model_name.human), status: :see_other
    end
  end

  def log_date_api
    @log = current_user.logs.where(log_date: params["date"])
    study_number = current_user.logs.where(log_date: params["date"]).pluck(:study_number)
    if study_number.all? {|x| x == 0 }
      @log.destroy_all
    end
    #logs(勉強の記録)が無い場合はstatus: 0, logs(勉強の記録)がある場合はstatus: 1を設定
    if @log.empty? || study_number.all? {|x| x == 0 }
      status = 0
    else
      status = 1
    end

    render json: { status: status, data: @log }
  end

  def status_done
    study = current_user.studies.where(id: params["id"])
    study.update(status: true)
    redirect_to calendars_path, success: t('defaults.message.status_done')
  end

  def status_not_done
    study = current_user.studies.where(id: params["id"])
    study.update(status: false)
    redirect_to calendars_path, success: t('defaults.message.status_not_done')
  end

  private

  def study_params
    params.require(:study).permit(:title, :total_number, :start_number, :end_number, :target_number, :url, :start_day, :day_of_week)
  end
end
