class AddIsBannerToProductPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :product_pictures, :is_banner, :boolean, default: false
  end
end
