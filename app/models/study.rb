class Study < ApplicationRecord
  belongs_to :user
  has_one :memo, dependent: :destroy
  has_many :studies, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :total_number, presence: true, length: { maximum: 5000 }
  validates :start_number, presence: true, length: { maximum: 5000 }
  validates :end_number, presence: true, length: { maximum: 5000 }
  validates :target_number, presence: true, length: { maximum: 5000 }
  validates :start_day, presence: true
  validates :day_of_week, presence: true
  validates :status, inclusion: { in: [true, false] }
end
