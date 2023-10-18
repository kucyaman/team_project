class Curriculum < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :curriculum_logs

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w(name created_at updated_at)
  end
end
