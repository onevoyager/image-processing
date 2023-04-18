class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      ImageWorker.perform_async(@image.id)
      redirect_to images_path
    else
      render :new
    end
  end

  def download
    @image = Image.find(params[:id])
    send_file @image.image_file.path,
              filename: @image.image_file.filename.to_s,
              type: @image.image_file.content_type,
              disposition: 'attachment'
  end
  
  private
  def image_params
    params.require(:image).permit(:title, :description, :author, :image_file)
  end
end
