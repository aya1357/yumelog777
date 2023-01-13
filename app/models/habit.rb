class Habit < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :total_number, presence: true, length: { maximum: 5000 }
  validates :start_number, presence: true, length: { maximum: 5000 }
  validates :end_number, presence: true, length: { maximum: 5000 }
  validates :target_number, presence: true, length: { maximum: 5000 }
  validates :start_day, presence: true

end
