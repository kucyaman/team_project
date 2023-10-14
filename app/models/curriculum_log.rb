class CurriculumLog < ApplicationRecord
  belongs_to :user
  belongs_to :curriculum
  belongs_to :chapter

  validates :title, presence: true, length: { maximum: 140 }
  validates :hour, presence: true
  validates :minutes, presence: true
end
