class HabitsController < ApplicationController
  def index
    @habits = Habit.all.includes(:user).order(created_at: :desc)
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      binding.pry
      redirect_to calendars_path, success: t('defaults.message.created', item: Habit.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Habit.model_name.human)
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :body, :start_day, :day_of_week, :habit_type, :total_number, :start_number, :end_number, :target_number, :url)
  end
end
