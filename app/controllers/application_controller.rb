class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  respond_to :html, :json

  def admin?; !! session[:admin] end

  private

    def graph_url path; "https://graph.facebook.com/#{path}" end
    def graph_headers; { 'Authorization' => 'Bearer CAAEx9di9v1QBALjeZAIuUsGV4OfqE4xBqKoCZBY2HrYmNLhP0MijTQ3FEWnJkWm8pVW5K1IyY4u4iMZBU4WDLzMWMUCVWSrBwwU2KIZBHrT4bVX4SNxV2aesuxzhYqgAcl926eHGg40qviRSLCDG5qNTLL8bnuPpeKzQYNvmh6J5ZA6FBbKYUoNvo5HAM92HCJmO2QuXTNyuKTnFXhFEp5TqXfWECSZCIgoFkxUmZBD2wZDZD' } end

    def albums
      @albums ||= Rails.cache.fetch 'facebook' do
        open graph_url('theglamourist/albums'), graph_headers do |f|
          JSON.parse(f.read)['data'].select do |album|
            album['type'] == 'normal' && album['name'] != 'Cover Photos'
          end.each do |album|
            cover = album['cover_photo'] =
              open graph_url("#{album['cover_photo']}"), graph_headers do |f|
                JSON.parse f.read
              end

            next unless cover
            cover['class'] = 'cover ' + (cover['width'] > cover['height'] ? 'landscape' : 'portrait')
            open "http://saturated.theglamourist.com/?url=#{CGI.escape cover['picture']}" do |saturated|
              hsla = JSON.parse saturated.read
              cover['saturated'] = "hsla(#{hsla['h']}, #{hsla['s']}%, #{hsla['l']}%, #{hsla['a']})"
            end

            album['custom_link'] = "https://www.facebook.com/media/set/?set=a.#{album['id']}"
          end.select do |album|
            album['cover_photo']
          end.sort_by do |album|
            [ 'Weddings', 'Before & Afters', 'Fashion', 'Engagement Sessions',
              'Boudoir', 'Press' ].index(album['name']) || 1000
          end
        end
      end
    end
    helper_method :albums

    def instagram
      @instagram ||= Rails.cache.fetch 'instagram' do
        url = 'https://api.instagram.com/v1/users/538328/media/recent/?access_token=538328.643541b.be39dd953e644df58d2ce0f2460b049c'
        open url do |f| JSON.parse(f.read)['data'] end
      end
    end
    helper_method :instagram

    def categories
      @categories ||= Category.order(:name)
    end
    helper_method :categories
end
