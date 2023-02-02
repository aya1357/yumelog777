class HabitLog < ApplicationRecord
  belongs_to :habit
  belongs_to :log
end
