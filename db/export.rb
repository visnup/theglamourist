#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'rubygems'
require 'rdiscount'
require 'nokogiri'

url = URI.parse 'http://posterous.com/api/2/users/me/sites/theglamourist-visnup/posts'
http = Net::HTTP.new url.host, url.port
http.set_debug_output $stderr
req = Net::HTTP::Post.new url.path
req.basic_auth '', ''

Post.all.each do |p|
  doc = Nokogiri::HTML::DocumentFragment.parse RDiscount.new(p.body).to_html
  doc.css('img').each { |img| img['class'] = 'posterous_download_image' }

  args = {
    'post[title]' => p.title,
    'post[body]' => doc.to_html,
    'post[display_date]' => p.created_at,
    'api_token' => ''
  }

  req.set_form_data args
  res = http.request req
  p res
end
