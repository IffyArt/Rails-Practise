class ProductPicture < ApplicationRecord
  belongs_to :product

  mount_uploader :file, ImageUploader

end
