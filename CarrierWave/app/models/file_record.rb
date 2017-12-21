class FileRecord < ApplicationRecord
  belongs_to :user
  mount_uploader :name, FileUploader
end
