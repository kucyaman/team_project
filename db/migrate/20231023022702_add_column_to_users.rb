class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remote_avatar_url, :string
    add_column :users, :remote_name, :string
  end
end
