class Product < ApplicationRecord
  has_many :product_pictures, dependent: :destroy
  has_many :order_details
  has_many :shopping_carts
  belongs_to :kind
  
  mount_uploader :image, ImageUploader
end
