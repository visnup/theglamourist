require 'open-uri'

class IndexController < ApplicationController
  def portfolio
    url = 'http://www.flickr.com/photos/20451842@N05/sets/72157617757170924/'
    @photos = open url do |f|
      n = Nokogiri::HTML f
      n.search('#setThumbs span.photo_container').map do |s|
        { :id => s['id'],
          :href => s.at('a.image_link')['href'],
          :src => s.at('img')['src'] }
      end
    end
  end
end
