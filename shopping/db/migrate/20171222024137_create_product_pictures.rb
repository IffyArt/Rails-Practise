class CreateProductPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :product_pictures do |t|
      t.references :product, foreign_key: true
      t.string :name, null: false
      t.string :file, null: false

      t.timestamps
    end
  end
end
