module StudiesHelper
  def calculate_study_total_number(study) # 総読書ページ数を計算(基本として目次から索引までのページ数)
    study_total_number = study.end_number - study.start_number
  end

  def calculate_study_total_days(study) # 総読書日数を計算(初期設定)
    study_total_number = calculate_study_total_number(study)
    if study_total_number % study.target_number == 0
      study_total_days = study_total_number / study.target_number
    else
      study_total_days = (study_total_number.to_f / study.target_number.to_f).ceil
    end
  end

  def calculate_total_studied_number(study, current_user)
    current_user.logs.where(study_id: study.id).pluck(:study_number).sum
  end

  def calculate_remain_study_days(study) # 総読書日数を計算(読書したページ数を差し引いて計算)
    total_studied_number = calculate_total_studied_number(study, current_user)
    remain_number = calculate_study_total_number(study) - total_studied_number
    if remain_number % study.target_number == 0
      remain_study_days = remain_number / study.target_number
    else
      remain_study_days = (remain_number.to_f / study.target_number.to_f).ceil
    end
  end

  def calculate_target_day(study) #目標終了予定日を計算(読書したページ数を加味せず初期設定での計算)
    study_total_days = calculate_study_total_days(study)
    dayOfWeek_arr = study.day_of_week.split(",").map(&:to_i).sort
    start_day = study.start_day
    while study_total_days >= 1
      if (dayOfWeek_arr).include?(start_day.wday)
        study_total_days -= 1
      end
      start_day += 1
    end
    return (start_day - 1).strftime('%Y年%m月%d日')
  end

  def automatic_end_day(study)
    today = Date.today
    remain_study_days = calculate_remain_study_days(study)
    dayOfWeek_arr = study.day_of_week.split(",").map(&:to_i).sort
    while remain_study_days >= 1
      if (dayOfWeek_arr).include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    (today - 1).strftime('%Y年%m月%d日')
  end
end
