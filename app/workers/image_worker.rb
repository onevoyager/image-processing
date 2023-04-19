require 'mini_magick'
class ImageWorker
  include Sidekiq::Worker
  def perform(image_id)
    image = Image.find(image_id)
    image.image_file.recreate_versions!
  end
end