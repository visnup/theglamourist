require 'spec_helper'

describe 'browsing the site', type: :feature do
  it 'should show me pages' do
    visit '/'
    expect(page).to have_content('Services')

    click_on 'About'
    expect(page).to have_content('empowering')

    within 'nav' do click_on 'services' end
    expect(page).to have_content('Bridal Packages')

    within 'footer' do click_on 'contact' end
    expect(page).to have_content('We try to respond promptly')
  end
end
