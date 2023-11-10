class Chapter < ApplicationRecord
    has_many :curriculums, dependent: :destroy
end
