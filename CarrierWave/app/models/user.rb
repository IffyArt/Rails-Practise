class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :file_records
end
