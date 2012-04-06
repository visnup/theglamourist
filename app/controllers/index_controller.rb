require 'open-uri'

class IndexController < ApplicationController
  before_filter :fetch_albums, :fetch_instagram, only: [:index, :portfolio]
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
    Rails.cache.clear

    render text: 'ok'
  end

  private
    def graph_url path; "https://graph.facebook.com/#{path}" end

    def fetch_albums
      @sets = Rails.cache.fetch 'albums' do
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
end
