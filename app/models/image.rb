class Image < ApplicationRecord
  mount_uploader :image_file, ImageUploader
end
