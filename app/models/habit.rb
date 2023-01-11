class Habit < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }

end
