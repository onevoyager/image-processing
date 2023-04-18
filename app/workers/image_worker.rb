require 'mini_magick'
class ImageWorker
  include Sidekiq::Worker

  def perform(image_id)
    image = Image.find(image_id)
    # image.image_file.recreate_versions!(:resize_to_fit => [200, 200])
      # image.image_file.variant(resize_to_fit: [200, 200]).processed
      # send_data image.image_file.download, filename: "image_#{image.id}_200px.jpg", type: "image/jpeg", disposition: "attachment"
    processed_image = image.image_file.variant(resize_to_fit: [200, 200]).processed
    send_data processed_image.download, filename: "image_#{image.id}_200px.jpg", type: "image/jpeg", disposition: "attachment"
  end

  

# class ImageWorker
#   include Sidekiq::Worker

#   def perform(image_id)
#     image = Image.find(image_id)

#     # Resize the image to fit within a box of 200x200 pixels while preserving its aspect ratio
#     image.image_file.variant(resize_to_fit: [200, 200]).processed

#     # Send the resized image as a download
#     send_data image.image_file.download, filename: "image_#{image.id}_200px.jpg", type: "image/jpeg", disposition: "attachment"
#   end
# end

end