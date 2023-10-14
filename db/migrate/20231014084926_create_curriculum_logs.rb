class CreateCurriculumLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculum_logs do |t|
      t.string :title,            null: false
      t.text :body
      t.integer :hour,            null: false
      t.integer :minutes,         null: false
      t.references :user,         null: false, foreign_key: true
      t.references :curriculum,   null: false, foreign_key: true
      t.references :chapter,      null: false, foreign_key: true

      t.timestamps                null: false
    end
  end
end
