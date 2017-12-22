class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string, unique: true
    add_column :users, :phone_memo, :string
    add_column :users, :credit_score, :float, defalut: 5.0
    add_column :users, :is_admin, :boolean, defalut: false
  end
end
