class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  respond_to :html, :json

  def admin?; !! session[:admin] end
end
