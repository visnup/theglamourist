require 'open-uri'

class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories

  def self.sync! pages = 1
    (1 .. pages).each do |page|
      xml = Crack::XML.parse open("http://glamourist.wordpress.com/feed/?paged=#{page}")
      xml['rss']['channel']['item'].each do |item|
        post = Post.where(guid: item['guid']).first_or_initialize
        post.update_attributes title: item['title'],
                               link: item['link'],
                               categories: item['category'],
                               description: item['description'],
                               html: item['content:encoded'],
                               created_at: Time.parse(item['pubDate'])
      end
    end
  end

  def to_param; link end
  def created_on; created_at.to_date end

  def category
    categories.first.try :name
  end

  def link= link
    self[:link] = link && link.sub('http://glamourist.wordpress.com/', '').sub(%r(/$), '')
  end

  def categories= categories
    categories = Array.wrap(categories).map(&:to_s).reject do |name|
      name.blank? || name == 'Uncategorized'
    end.map do |name|
      Category.where(name: name.downcase).first_or_initialize
    end

    super categories
  end

  def description= description
    self[:description] = description && description.sub(/Filed under: .*/, '').sub(/<(a|img) .*/, '').sub(/ \[\u2026\]/, '').sub(/ +$/, '')
  end

  def html= html
    self[:html] = html && html.sub(/Filed under: .*/, '')
  end
end
