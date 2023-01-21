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
      redirect_to calendars_path, success: t('defaults.message.created', item: Habit.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Habit.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @habit = current_user.habits.find(params[:id])
  end

  def update
    @habit = current_user.habits.find(params[:id])
    if @habit.update(habit_params)
      redirect_to calendars_path, success: t('defaults.message.updated', item: Habit.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Habit.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit = current_user.habits.find(params[:id])
    @habit.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Habit.model_name.human), status: :see_other
  end

  private

  def habit_params
    params.require(:habit).permit(:title, :habit_type, :total_number, :start_number, :end_number, :target_number, :url, :start_day, :day_of_week)
  end
end
