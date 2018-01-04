class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :is_send, default: false
      t.boolean :is_pay, default: false
      t.string :memo
      t.string :address
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
