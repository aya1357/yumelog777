class Study < ApplicationRecord
  belongs_to :user
  has_one :memo, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :total_number, presence: true, length: { maximum: 5000 }
  validates :start_number, presence: true, length: { maximum: 5000 }
  validates :end_number, presence: true, length: { maximum: 5000 }
  validates :target_number, presence: true, length: { maximum: 5000 }
  validates :start_day, presence: true
  validates :day_of_week, presence: true
  validates :status, inclusion: { in: [true, false] }

  #読書をする総ページ数を返す(目次から索引までのページ数)
  def total_pages
    end_number - start_number
  end

  #読書した総ページ数を返す
  def total_read_pages(user_id)
    logs.where(user_id: user_id).pluck(:study_number).sum
  end

  #読書したページ数を加味して、残りページ数を返す
  def remain_pages(user_id, studied_pages)
    remain_number = total_pages - (total_read_pages(user_id) + studied_pages.to_i)
    [remain_number, 0].max
  end

  #読書したページ数を加味して、自動計算終了日として終了日を返す
  def automatic_calculation_end_date(user_id, studied_pages)
    today = Time.zone.today
    remaining_days = remain_pages(user_id, studied_pages)
    end_day = remaining_days == 0 ? today : get_end_date(today, remaining_days)
  end

  #自動計算終了日を返す関数を設定
  def get_end_date(today, remaining_days)
    day_of_week_arr = day_of_week.split(",").map(&:to_i).sort
    remain_study_days = (remaining_days / target_number.to_f).ceil
    while remain_study_days >= 1
      if day_of_week_arr.include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    (today - 1)
  end
end
