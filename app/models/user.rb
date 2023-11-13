class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_many :curriculum_logs, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :avatar, to: :profile, prefix: true, allow_nil: true
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :authentications

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def hours_with_minutes
    total_hours = total_curriculum_hours + total_profile_hours
    total_minutes = total_profile_minutes.present? ? (total_profile_minutes + total_curriculum_minutes) : total_curriculum_minutes

    adjust_hours_and_minutes(total_hours, total_minutes)
  end

  private

  def total_curriculum_hours
    curriculum_logs.sum("(hour + (minutes / 60))")
  end

  def total_curriculum_minutes
    curriculum_logs.sum("(minutes % 60)")
  end

  def total_profile_hours
    profile.hour.to_i
  end

  def total_profile_minutes
    profile.minutes&.to_i || 0
  end

  def adjust_hours_and_minutes(total_hours, total_minutes)
    total_hours += total_minutes / 60
    total_minutes %= 60
    [total_hours.to_i, total_minutes.to_i]
  end
end