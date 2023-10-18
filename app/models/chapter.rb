class Chapter < ApplicationRecord
  belongs_to :curriculum
  has_many :curriculum_logs

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w(name curriculum_id created_at updated_at)
  end
end
