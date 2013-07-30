class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_image
  	@id = current_user.id
  	@image = Image.where(user_id: @id).last
  end
  helper_method :current_image
end
