require 'spec_helper'

describe 'index routing' do
  specify { expect( get: '/'          ).to route_to('index#index') }
  specify { expect( get: '/about'     ).to route_to('index#about') }
  specify { expect( get: '/services'  ).to route_to('index#services') }
  specify { expect( get: '/portfolio' ).to_not be_routable }

  it 'should route ids to expire' do
    expect( get: '/expire/tumblr' ).to route_to('index#expire', id: 'tumblr')
  end
end
