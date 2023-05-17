class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top; end

  def privacy_policy; end

  def guide; end

  def start; end

  def log_chart
    # 週ごとの読書ページ数を取得
    @start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today.beginning_of_week
    @end_date = @start_date.end_of_week

    @default_data = (@start_date..@end_date).map { |date| [date, 0] }.to_h
    @log_data = current_user.logs.where(log_date: @start_date..@end_date).group(:log_date).order(:log_date).sum(:study_number)

    @chart_data = @default_data.merge(@log_data)

    # 月ごとのデータを取得します
    @start_month = @start_date.beginning_of_month
    @end_month = @start_date.end_of_month

    @default_monthly_data = (@start_month..@end_month).map { |date| [date, 0] }.to_h
    @monthly_log_data = current_user.logs.where(log_date: @start_month..@end_month).group(:log_date).order('log_date ASC').sum(:study_number)

    @monthly_chart_data = @default_monthly_data.merge(@monthly_log_data)

    respond_to do |format|
      format.html
      format.js { render json: @chart_data }
    end
  end
end
