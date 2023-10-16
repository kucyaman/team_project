class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name,     null: false
      t.string :language
      t.string :introduction
      t.string :avatar
      t.references :user, null: false, foreign_key: true

      t.timestamps        null: false
    end
  end
end
