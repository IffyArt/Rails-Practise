class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :phone, :string, unique: true
    add_column :users, :phone_memo, :string
    add_column :users, :rating, :float, default: 0
    add_column :users, :rating_count, :float, default: 0
    add_column :users, :is_admin, :boolean, default: false
  end
end
