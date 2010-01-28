atom_feed do |feed|
  feed.title "the glamourist"
  feed.updated @posts.first.updated_at unless @posts.empty?

  @posts.each do |p|
    feed.entry p do |entry|
      entry.title p.title
      entry.content p.body_as_html, :type => "html"
    end
  end
end
