class CalendarsController < ApplicationController
  def index
    @studies = Study.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
    @logs = Log.where(user_id: current_user.id)
    @log_dates = current_user.logs.pluck(:log_date)
  end

  def destroy
    @study = current_user.studies.find(params[:id])
    @study.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Study.model_name.human), status: :see_other
  end

end
