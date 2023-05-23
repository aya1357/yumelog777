class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top; end

  def privacy_policy; end

  def guide; end

  def start; end

  def log_chart
    # すべての読書ページ数の合計を取得
    @total_read_pages = current_user.logs.sum(:study_number)
    # 今月の始まりと終わりを取得
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    # 今月の読書ページ数の合計を取得
    @total_this__month_read_pages = current_user.logs.where(log_date: start_date..end_date).sum(:study_number)

    # 今月の目標ページ数の総計を取得
    total_target_number = 0
    studies = current_user.studies

    # 各スタディについて
    studies.each do |study|
      # スタディの開始日が今月以前であることを確認
      if study.start_day <= end_date && !study.status
        # スタディが始まる日付と今月の終わりの間の日付を計算
        read_start_date = [study.start_day, start_date].max
        read_end_date = end_date

        # スタディの目標曜日を配列として取得
        target_days_of_week = study.day_of_week.split(',').map(&:to_i)

        # スタディが始まる日付と今月の終わりの間の各日について
        (read_start_date..read_end_date).each do |date|
          # その日がスタディの目標曜日のいずれかであれば、目標ページ数を合計に加算
          if target_days_of_week.include?(date.wday)
            total_target_number += study.target_number
          end
        end
      end
    end

    @total_this_month_target_number = total_target_number
    
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
