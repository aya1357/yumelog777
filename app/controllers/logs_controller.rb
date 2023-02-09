class LogsController < ApplicationController
  def index
    @habit = current_user.habits.find(params[:habit_id])
  end
end
