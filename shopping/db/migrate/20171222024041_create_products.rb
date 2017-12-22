class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.float :discounted
      t.date :discounted_start_date
      t.date :discounted_end_date
      t.integer :amount, null: false
      t.text :description, null: false
      t.text :content, null: false
      t.string :kind_references

      t.timestamps
    end
  end
end
