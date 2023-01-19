class CalendarsController < ApplicationController
  def index
    @habits = Habit.all.includes(:user).order(created_at: :desc)
  end
end
