require 'spec_helper'

describe 'contacting' do
  context 'filling out the form' do
    before do
      visit '/'
      click_on 'Contact'

      fill_in 'Name', with: 'Visnu'
      fill_in 'Email', with: 'visnupx@gmail.com'
      fill_in 'Phone number', with: '415-305-7168'
      select 'Wedding', from: 'Service type'
      select Date.today.year.to_s, from: 'contact[event_at(1i)]'
      select 'March', from: 'contact[event_at(2i)]'
      select '3', from: 'contact[event_at(3i)]'
      fill_in 'Event location', with: 'Phuket, Thailand'
      select '4 PM', from: 'contact[ready_time(4i)]'
      select '15', from: 'contact[ready_time(5i)]'
      fill_in 'Size of bridal party', with: '2'
      fill_in 'contact[message]', with: 'Huggies!'

      click_on 'Send'
    end

    it 'tells the user email was sent' do
      expect(page).to have_content 'Thanks'
    end

    describe 'the email' do
      subject { ActionMailer::Base.deliveries.last }

      its(:from) { should include('visnupx@gmail.com') }
      its(:body) do
        should include('415-305-7168')
        should include('Phuket, Thailand')
        should include("March  3, #{Date.today.year}")
        should include('4:15 PM')
        should include('2')
        should include('Huggies!')
      end
    end
  end
end
