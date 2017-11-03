class UploadImagesController < ApplicationController
  def create
  	 @uploaded_image = UploadImage.new( image_params )
  	 @uploaded_image.user = current_user
  	 @uploaded_image.post = params[:post_id].to_i

  end
  def image_params
	  params.require(:upload_image).permit(:uploaded_image)
  end
end
