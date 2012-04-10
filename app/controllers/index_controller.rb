require 'open-uri'

class IndexController < ApplicationController
  before_filter :fetch_albums, :fetch_posts,
    only: [:index, :portfolio]
  caches_page :index, :portfolio

  def proxy
    open params[:url] do |f|
      response.headers['Last-Modified'] = f.last_modified.to_s :rfc822
      response.headers['Cache-Control'] = 'max-age=1209600'
      send_data f.read, type: f.content_type, disposition: 'inline'
    end
  end

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
    Rails.cache.clear

    render text: 'ok'
  end

  private
    def graph_url path; "https://graph.facebook.com/#{path}" end

    def fetch_albums
      @sets = Rails.cache.fetch 'facebook' do
        open graph_url('theglamourist/albums') do |f|
          JSON.parse(f.read)['data'].select do |set|
            set['type'] == 'normal'
          end.each do |set|
            open graph_url(set['cover_photo']) do |f|
              set['cover_photo'] = JSON.parse f.read
            end
            open graph_url("#{set['id']}/photos") do |f|
              set['photos'] = JSON.parse(f.read)['data']
            end
          end
        end
      end
    end

    def fetch_instagram
      @instagram =
        Rails.cache.fetch 'instagram' do
          url = 'https://api.instagram.com/v1/users/538328/media/recent/?access_token=538328.643541b.be39dd953e644df58d2ce0f2460b049c'
          open url do |f| JSON.parse(f.read)['data'] end
        end
    end

    def fetch_posts
      @posts =
        Rails.cache.fetch 'tumblr' do
          url = 'http://api.tumblr.com/v2/blog/theglamourist.tumblr.com/posts/text?api_key=dIFA35FeL5NzEN7r9xzkEw0neZgIZxNvxxKQ7AneQBh6qVGTjc&type=text&filter=text'
          total = open url do |f|
            JSON.parse(f.read)['response']['total_posts']
          end
          open "#{url}&offset=#{total-10}" do |f|
            JSON.parse(f.read)['response']['posts']
          end.reverse
        end
    end
end
