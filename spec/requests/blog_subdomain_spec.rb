require 'spec_helper'

describe 'blog subdomain redirects', type: :request do
  specify { expect( get 'http://blog.example.com/' ).to redirect_to('http://example.com/blog') }
  specify { expect( get 'http://blog.example.com/2013/01/01/new-years' ).to redirect_to('http://example.com/blog/2013/01/01/new-years') }
  specify { expect( get 'http://blog.example.com/rss' ).to redirect_to('http://feeds.feedburner.com/theglamourist/sTqj') }
end
