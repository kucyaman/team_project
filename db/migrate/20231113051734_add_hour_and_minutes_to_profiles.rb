class AddHourAndMinutesToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :hour, :integer
    add_column :profiles, :minutes, :integer
  end
end
