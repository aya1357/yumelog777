class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :studies, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }

  # 入力されたメールアドレスを全て小文字にする（メールアドレスは大小を区別しないため）
  before_save { self.email = email.downcase }
  # メールアドレスのフォーマットを確認
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, uniqueness: true, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }

  # パスワードは半角アルファベット（大文字・小文字・数値）
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze

  validates :password, length: { minimum: 3 }, length: { maximum: 20 }, format: { with: VALID_PASSWORD_REGEX }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1, guest: 2 }
end
