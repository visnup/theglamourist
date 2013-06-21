module BlogHelper
  def translate_link wordpress
    wordpress.sub 'http://glamourist.wordpress.com', '/blog'
  end
end
