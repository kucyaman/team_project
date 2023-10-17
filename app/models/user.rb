class User < ApplicationRecord
  has_many :curriculum_logs, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :avatar, to: :profile, prefix: true, allow_nil: true

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
end
