class Image < ApplicationRecord
  # mount_uploader :image_file, ImageUploader
  # mount_uploader :processed_image_file, ImageUploader

  # validates :title, presence: true
  # validates :image_file, presence: true

  # after_commit :process_image, on: :create

  # def process_image
  #     ImageWorker.perform_async(id)
  # end

  mount_uploader :image_file, ImageUploader
end
