class FileRecord < ApplicationRecord
  belongs_to :user
  mount_uploader :path, FileUploader
end
