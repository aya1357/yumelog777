class CalendarsController < ApplicationController
  def index
    @habits = Habit.all.includes(:user).order(created_at: :desc)
  end

  def destroy
    @habit = current_user.habits.find(params[:id])
    @habit.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Habit.model_name.human), status: :see_other
  end

end
