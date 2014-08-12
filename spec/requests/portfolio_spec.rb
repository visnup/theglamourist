require 'spec_helper'

describe 'portfolio redirects', type: :request do
  specify { expect( get '/portfolio' ).to redirect_to('https://www.facebook.com/theglamourist/photos_albums') }
end
