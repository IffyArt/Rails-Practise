class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :is_send, default: false
      t.boolean :is_pay, default: false
      t.string :memo
      t.string :address
      t.string :bank
      t.string :bank_num
      t.string :account
      t.string :account_name
      t.integer :rating
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
