class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :study
end
