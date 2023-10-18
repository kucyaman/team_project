class CurriculumLog < ApplicationRecord
  belongs_to :user
  belongs_to :curriculum
  belongs_to :chapter

  validates :title, presence: true, length: { maximum: 140 }
  validates :hour, presence: true
  validates :minutes, presence: true

  def self.ransackable_attributes(auth_object = nil)
    super & %w(body chapter_id created_at curriculum_id hour minutes title updated_at user_id)
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w(curriculum chapter)
  end

end
