class Log < ApplicationRecord
  belongs_to :user
  has_many :habit_logs
  has_many :habits, through: :habit_logs
end
