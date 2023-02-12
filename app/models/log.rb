class Log < ApplicationRecord
  belongs_to :user
  has_many :study_logs
  has_many :studies, through: :study_logs
end
