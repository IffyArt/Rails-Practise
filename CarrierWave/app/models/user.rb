class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :files, FileUploader
  has_many :file_records, dependent: :destroy
end
