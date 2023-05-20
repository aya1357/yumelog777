class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top; end

  def privacy_policy; end

  def guide; end

  def start; end

  def log_chart
    # 週ごとの読書ページ数を取得
    @week_start_date = params[:week_start_date].present? ? Date.parse(params[:week_start_date]) : Date.today.beginning_of_week
    @week_end_date = @week_start_date.end_of_week
    @default_data = (@week_start_date..@week_end_date).map { |date| [date, 0] }.to_h
    @log_data = current_user.logs.where(log_date: @week_start_date..@week_end_date).group(:log_date).order(:log_date).sum(:study_number)
    @chart_data = @default_data.merge(@log_data)

    respond_to do |format|
      format.html
      format.js { render json: @chart_data }
    end
  end
end
