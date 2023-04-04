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

  def calculate_remain_study_days(study, total_studied_number) # 総読書日数を計算(読書したページ数を差し引いて計算)
    remain_number = calculate_study_total_number(study) - total_studied_number
    if remain_number % study.target_number == 0
      remain_study_days = remain_number / study.target_number
    else
      remain_study_days = (remain_number.to_f / study.target_number.to_f).ceil
    end
  end

  def calculate_target_day(study_total_days, dayOfWeek_arr, start_day)
    while study_total_days >= 1
      if (dayOfWeek_arr).include?(start_day.wday)
        study_total_days -= 1
      end
      start_day += 1
    end
    return (start_day - 1).strftime('%Y年%m月%d日')
  end

  def automatic_end_day(remain_study_days, dayOfWeek_arr)
    today = Date.today
    while remain_study_days >= 1
      if (dayOfWeek_arr).include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    (today - 1).strftime('%Y年%m月%d日')
  end


end
