class User < ApplicationRecord
  has_many :curriculum_logs, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :avatar, to: :profile, prefix: true, allow_nil: true
  accepts_nested_attributes_for :profile


  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def hours_with_minutes
    total_hours = curriculum_logs.sum("(hour + (minutes / 60))")
    total_minutes = curriculum_logs.sum("(minutes % 60)")
    total_hours += total_minutes / 60
    total_minutes = total_minutes % 60
    [total_hours, total_minutes]
  end
  
end
