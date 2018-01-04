class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :phone, :string, unique: true
    add_column :users, :phone_memo, :string
    add_column :users, :credit_score, :float, default: 5.0
    add_column :users, :is_admin, :boolean, default: false
  end
end
