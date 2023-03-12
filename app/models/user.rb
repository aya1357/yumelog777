class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :studies, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :password, length: { minimum: 3 }, length: { maximum: 255 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1, guest: 2 }
end

