module StudiesHelper
  # 総読書ページ数を計算(基本として目次から索引までのページ数)
  def total_pages(study)
    study.end_number - study.start_number
  end

  # 総読書日数を計算(初期設定)
  def total_days(study)
    (total_pages(study).to_f / study.target_number.to_f).ceil
  end

  # 総読書したページ数を計算
  def total_read_pages(study, current_user)
    current_user.logs.where(study_id: study.id).pluck(:study_number).sum
  end

  # 残り読書ページ数を計算
  def remain_pages(study)
    [total_pages(study) - total_read_pages(study, current_user), 0].max
  end

  # 残り読書ページ数から総読書日数を計算(読書したページ数を差し引いて計算)
  def remain_days(study)
    (remain_pages(study).to_f / study.target_number.to_f).ceil
  end

  #目標終了予定日を計算(読書したページ数を加味せず初期設定での計算)
  def target_end_date(study)
    study_total_days = total_days(study)
    dayOfWeek_arr = study.day_of_week.split(",").map(&:to_i).sort
    start_day = study.start_day
    while study_total_days >= 1
      if (dayOfWeek_arr).include?(start_day.wday)
        study_total_days -= 1
      end
      start_day += 1
    end
    (start_day - 1)
  end

  #目標終了予定日を計算(読書したページ数を加味して終了日を計算)
  def automatic_calculation_end_day(study)
    today = Date.today
    remain_study_days = remain_days(study)
    dayOfWeek_arr = study.day_of_week.split(",").map(&:to_i).sort
    while remain_study_days >= 1
      if (dayOfWeek_arr).include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    (today - 1)
  end
end
