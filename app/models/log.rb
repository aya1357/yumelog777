class Log < ApplicationRecord
  belongs_to :user
  belongs_to :study

  with_options presence: true do
    validates :log_date
    validates :study_number
  end

  def remain_pages(studied_pages)
    remain_number = total_study_number.to_i - (total_studied_number.to_i + studied_pages.to_i)
    remain_number >= 0 ? remain_number : 0
  end
end
