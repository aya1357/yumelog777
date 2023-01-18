class HabitsController < ApplicationController
  def index
    @habits = Habit.all.includes(:user).order(created_at: :desc)
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = current_user.habits.build(habit_params)
    binding.pry
    if @habit.save
      redirect_to calendars_path, success: t('defaults.message.created', item: Habit.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Habit.model_name.human)
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :habit_type, :total_number, :start_number, :end_number, :target_number, :url, :start_day, :day_of_week)
  end
end
