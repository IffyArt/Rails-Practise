class Product < ApplicationRecord
  has_many :product_pictures, dependent: :destroy
  has_many :order_details
  has_many :shopping_carts
  belongs_to :kind

  validates :name, :presence => true
  validates :kind, :presence => true
  validates :content, :presence => true
  validates :description, :presence => true, length: { in: 10..50 }
  validates_numericality_of :price, :greater_than => 0
  validates_numericality_of :amount, :greater_than => -1

  mount_uploader :image, ImageUploader
end
