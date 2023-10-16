class Curriculum < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :curriculum_logs

  validates :name, presence: true
end
