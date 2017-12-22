class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :is_send, default: false
      t.string :logistics_id
      t.string :memo

      t.timestamps
    end
  end
end
