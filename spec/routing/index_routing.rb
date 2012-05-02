require 'spec_helper'

describe IndexController do
  specify { { get: '/'          }.should route_to('index#index') }
  specify { { get: '/about'     }.should route_to('index#about') }
  specify { { get: '/portfolio' }.should route_to('index#portfolio') }
  specify { { get: '/services'  }.should route_to('index#services') }

  it 'should route ids to expire' do
    { get: '/expire/tumblr' }.should route_to('index#expire', id: 'tumblr')
  end
end
