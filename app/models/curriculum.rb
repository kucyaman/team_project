class Curriculum < ApplicationRecord
  has_many :capters, dependent: :destroy
  has_many :curriculum_logs

  validates :name, presence: true
end
