class AddAttributesToUserModel < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :archived, :boolean, default: false
    add_column :users, :test, :boolean, default: false
    add_column :users, :dummy, :boolean, default: false
    add_column :users, :time_zone, :string, default: "UTC"

    add_index :users, :archived
    add_index :users, :last_name
  end
end
