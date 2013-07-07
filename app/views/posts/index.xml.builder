xml.rss 'xmlns:content' => 'http://purl.org/rss/1.0/modules/content/', version: '2.0' do
  xml.channel do
    xml.title 'The Glamourist'
    xml.description 'Jane Kim, owner and founder of The Glamourist, is an award winning makeup artist and hair stylist based in San Francisco.'
    xml.link posts_url

    if @posts.present?
      xml.pubDate @posts.first.created_at.rfc822
      xml.lastBuildDate @posts.map(&:updated_at).max.rfc822

      @posts.each do |post|
        xml.item do
          xml.title post.title
          xml.description { xml.cdata! post.description }
          xml.link post_url(post)
          xml.guid post.guid
          xml.pubDate post.created_at.rfc822
          post.categories.each do |category|
            xml.category category.name.titleize
          end
          xml.tag!('content:encoded') { xml.cdata! post.html }
        end
      end
    end
  end
end
