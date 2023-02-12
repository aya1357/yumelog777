class CalendarsController < ApplicationController
  def index
    @studies = Study.all.includes(:user).order(created_at: :desc)
  end

  def destroy
    @study = current_user.studies.find(params[:id])
    @study.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Study.model_name.human), status: :see_other
  end

end
