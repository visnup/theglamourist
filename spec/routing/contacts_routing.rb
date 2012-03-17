require 'spec_helper'

describe 'contacts routing' do
  it 'does not expose index, edit, update, destroy' do
    { get: '/contacts' }.should_not be_routable
    { get: '/contacts/1/edit' }.should_not be_routable
    { put: '/contacts/1' }.should_not be_routable
    { delete: '/contacts/1' }.should_not be_routable
  end
end
