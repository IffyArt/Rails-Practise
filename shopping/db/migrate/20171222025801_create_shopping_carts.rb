class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
