class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :files, FileUploader
end
