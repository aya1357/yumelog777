class Log < ApplicationRecord
  belongs_to :user
  belongs_to :study

  with_options presence: true do
    validates :log_date
    validates :study_number
  end
end
