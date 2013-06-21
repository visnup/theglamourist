class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  respond_to :html, :json

  def admin?; !! session[:admin] end

  protected
    def fetch_posts
      params[:page]
      @posts =
        Rails.cache.fetch 'wordpress' do
          xml = Crack::XML.parse open('http://glamourist.wordpress.com/feed/')
          xml['rss']['channel']['item']
        end
    end
end
