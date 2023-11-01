class AddChapterIdToCurriculums < ActiveRecord::Migration[7.0]
  def change
    add_reference :curriculums, :chapter, foreign_key: true
  end
end
