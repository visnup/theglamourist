require 'open-uri'

class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories

  def self.sync! pages = 1
    (1 .. pages).each do |page|
      url = "https://glamourist.wordpress.com/feed/?paged=#{page}"
      print "Fetching #{url}... "
      xml = Crack::XML.parse open(url)
      xml['rss']['channel']['item'].each do |item|
        post = Post.where(guid: item['guid']).first_or_initialize
        post.update_attributes title: item['title'],
                               link: item['link'],
                               categories: item['category'],
                               description: item['description'],
                               html: item['content:encoded'],
                               created_at: Time.parse(item['pubDate'])
      end
      puts 'done'
    end
  rescue OpenURI::HTTPError
    puts 'missing'
  end

  def to_param; link end
  def created_on; created_at.to_date end

  def category; categories.first end
  def category_name; category.try :name end

  def link= link
    self[:link] = link && link.sub('http://glamourist.wordpress.com/', '').sub(%r(/$), '')
  end

  def categories= categories
    categories = Array.wrap(categories).map(&:to_s).reject do |name|
      name.blank? || name == 'Uncategorized'
    end.map do |name|
      Category.where(name: name).first_or_initialize
    end

    super categories
  end

  def description= description
    self[:description] = description && description.sub(/Filed under: .*/, '').sub(/<(a|img) .*/, '').sub(/ \[\u2026\]/, '').sub(/ +$/, '')
  end

  def html= html
    self[:html] = html && html.sub(/(\s<br \/>)?Filed under: .*/, '')
  end
end
