class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  default_scope :order => 'created_at DESC'

  def to_param
    "#{id}-#{title.gsub(/\W+/, '-')}"
  end

  def body_as_html
    Markdown.new(body).to_html
  end
end