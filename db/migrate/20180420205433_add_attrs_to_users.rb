class AddAttrsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :integer, default: 0, index: true, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :organization, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :zip, :string, null: false
    add_column :users, :phone, :string
  end
end
