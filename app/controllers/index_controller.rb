require 'open-uri'

class IndexController < ApplicationController
  before_filter :photos_from_flickr, :only => [:index, :portfolio]
  caches_page :index, :portfolio

  def login
    session[:admin] = true  if params[:password] == '<3ugf'
    redirect_to root_url
  end

  def logout
    reset_session
    redirect_to root_url
  end

  def expire
    expire_page '/'
    expire_page '/portfolio'
    render :text => 'ok'
  end

  private
    def api_key; '18635c5ffedaf5681361e557ad8ed565' end

    def photos_from_flickr
      url = "http://api.flickr.com/services/rest/?method=flickr.collections.getTree&api_key=#{api_key}&collection_id=20446502-72157624005829771&user_id=20451842%40N05&format=json&nojsoncallback=1"

      @sets =
        open url do |f|
          collection = JSON.parse(f.read)['collections']['collection'].first
          collection['set'].map do |set|
            url = "http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=#{api_key}&photoset_id=#{set['id']}&format=json&nojsoncallback=1"
            photos = open(url) { |f| JSON.parse(f.read)['photoset']['photo'] }
            photos.reverse!.each do |p|
              p['href'] = "http://www.flickr.com/photos/20451842%40N05/#{p['id']}"
              p['src'] = "http://farm#{p['farm']}.static.flickr.com/#{p['server']}/#{p['id']}_#{p['secret']}_s.jpg"
            end

            { 'id' => set['id'],
              'title' => set['title'],
              'photos' => photos }
          end
        end
    end
end
