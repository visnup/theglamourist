require 'spec_helper'

describe Notifier do
  describe 'new_contact' do
    let!(:contact) { create :contact }

    subject { ActionMailer::Base.deliveries.last }

    its(:to)      { should include('jane@theglamourist.com') }
    its(:cc)      { should include('vi@theglamourist.com') }
    its(:from)    { should include(contact.email) }
    its(:subject) { should match('[theglamourist]') }
  end
end
