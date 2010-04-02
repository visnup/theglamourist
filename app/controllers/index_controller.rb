class IndexController < ApplicationController
  before_filter :photos_from_flickr, :only => [:index, :portfolio]
  caches_page :index, :portfolio

  def index
    @photos = @photos[0, 3]
  end

  def portfolio
  end

  def login
    session[:admin] = true  if params[:password] == 'blah'
    redirect_to root_url
  end

  def logout
    reset_session
    redirect_to root_url
  end

  def expire
    expire_page "/"
    expire_page "/portfolio"
    render :text => "ok"
  end

  private
    def photos_from_flickr
      url = 'http://www.flickr.com/photos/20451842@N05/sets/72157617757170924/'
      @photos = open url do |f|
        n = Nokogiri::HTML f
        n.search('#setThumbs span.photo_container').map do |s|
          { :id => s['id'],
            :href => s.at('a.image_link')['href'],
            :src => s.at('img')['src'] }
        end
      end.reverse
    end
end
