class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.integer :amount, null: false
      t.text :description, null: false
      t.text :content, null: false
      t.references :kind, foreign_key: true

      t.timestamps
    end
  end
end
