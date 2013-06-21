require 'open-uri'

class BlogController < ApplicationController
  before_filter :fetch_posts, only: [:index]

  def show
    url = "http://glamourist.wordpress.com/#{params[:url]}"
    @post =
      Rails.cache.fetch url do
        oembed = "http://public-api.wordpress.com/oembed/1.0/?format=json&url=#{CGI.escape url}&for=wpcom-auto-discovery"
        open(oembed) { |f| JSON.parse f.read }
      end
  end
end
