module StudiesHelper
  def calculate_study_total_number(study)
    study_total_number = study.end_number - study.start_number
  end

  def calculate_study_total_days(study)
    study_total_number = calculate_study_total_number(study)
    if study_total_number % study.target_number == 0
      study_total_days = study_total_number / study.target_number
    else
      study_total_days = (study_total_number.to_f / study.target_number.to_f).ceil
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
end
