require 'spec_helper'

describe 'contacts routing', type: :routing do
  it 'does not expose index, edit, update, destroy' do
    expect( get: '/contacts' ).not_to be_routable
    expect( get: '/contacts/1/edit' ).not_to be_routable
    expect( put: '/contacts/1' ).not_to be_routable
    expect( delete: '/contacts/1' ).not_to be_routable
  end
end
