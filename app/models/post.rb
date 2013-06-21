require 'open-uri'

class Post < ActiveRecord::Base
  serialize :categories, Array

  def self.sync!
    (1 .. 3).each do |page|
      xml = Crack::XML.parse open("http://glamourist.wordpress.com/feed/?paged=#{page}")
      xml['rss']['channel']['item'].each do |item|
        post = Post.where(guid: item['guid']).first_or_initialize
        post.update_attributes title: item['title'],
                               link: item['link'],
                               categories: item['category'],
                               guid: item['guid'],
                               description: item['description'],
                               html: item['content:encoded'],
                               created_at: Time.parse(item['pubDate'])
      end
    end
  end

  def to_param; link end

  def link= link
    self[:link] = link && link.sub('http://glamourist.wordpress.com/', '').sub(%r(/$), '')
  end

  def categories= categories
    self[:categories] = Array.wrap(categories).map(&:to_s).reject do |category|
      category.blank? || category == 'Uncategorized'
    end
  end

  def description= description
    self[:description] = description && description.sub(/<(a|img) .*/, '').sub(/ \u2026 $/, '').sub(/Filed under: .*/, '').sub(/ +$/, '')
  end

  def html= html
    self[:html] = html && html.sub(/Filed under: .*/, '')
  end
end
