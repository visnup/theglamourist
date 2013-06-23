require 'open-uri'

class IndexController < ApplicationController
  before_filter :fetch_albums, except: [:login, :logout, :expire, :error]
  before_filter :fetch_profile, only: [:about]
  caches_page :index, :about, :services

  def index
    @album = @albums[2]
    @cover = @album['cover_photo']
    @posts = Post.order(created_at: :desc).page(1).per(5)
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
    expire_page '/about'
    expire_page '/services'

    if params[:id]
      Rails.cache.delete params[:id]
    else
      Rails.cache.clear
    end
  end

  private

    def fetch_profile
      @photo =
        Rails.cache.fetch 'profile_photo' do
          open graph_url('395172810510954') do |f|
            JSON.parse(f.read)
          end
        end
    end
end
