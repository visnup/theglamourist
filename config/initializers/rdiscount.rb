# turn on smartypants by default
class RDiscount
  def initialize text, *extensions
    @text = text
    @smart = true
    @filter_styles = nil
    @filter_html = nil
    @fold_lines = nil
    extensions.each { |e| e.send("#{e}=", true) }
  end
end
