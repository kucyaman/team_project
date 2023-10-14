class Chapter < ApplicationRecord
  belongs_to :curriculum
  has_many :curriculum_logs

  validates :name, presence: true
end
