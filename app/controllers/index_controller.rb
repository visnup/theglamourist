require 'open-uri'

class IndexController < ApplicationController
  before_filter :fetch_albums, except: [:login, :logout, :expire, :error]
  before_filter :fetch_profile, only: [:about]
  caches_page :index, :about, :services

  def index
    @album = @albums[2]
    @cover = @album['cover_photo']
    @posts = Post.order(created_at: :desc).page(1).per(8)
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
    def graph_url path; "https://graph.facebook.com/#{path}" end

    def fetch_albums
      @albums = Rails.cache.fetch 'facebook' do
        open graph_url('theglamourist/albums') do |f|
          JSON.parse(f.read)['data'].select do |album|
            album['type'] == 'normal' && album['name'] != 'Cover Photos'
          end.each do |album|
            cover = album['cover_photo'] =
              open graph_url("#{album['cover_photo']}") do |f|
                JSON.parse f.read
              end

            next unless cover
            cover['class'] = 'cover ' + (cover['width'] > cover['height'] ? 'landscape' : 'portrait')
            open "http://saturated.theglamourist.com/?url=#{CGI.escape cover['picture']}" do |saturated|
              hsla = JSON.parse saturated.read
              cover['saturated'] = "hsla(#{hsla['h']}, #{hsla['s']}%, #{hsla['l']}%, #{hsla['a']})"
            end
          end.select do |album|
            album['cover_photo']
          end.sort_by do |album|
            [ 'Weddings', 'Before & Afters', 'Fashion', 'Engagement Sessions',
              'Boudoir', 'Press' ].index(album['name']) || 1000
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

    def fetch_profile
      @photo =
        Rails.cache.fetch 'profile_photo' do
          open graph_url('395172810510954') do |f|
            JSON.parse(f.read)
          end
        end
    end
end
