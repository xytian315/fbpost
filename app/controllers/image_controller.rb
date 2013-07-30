class ImageController < ApplicationController

  def create
  	@image = current_user.build_image(params[:image])
	if @image.save
    flash[:notice] = "Successfully created painting."
    redirect_to root_url
	end
  end
end