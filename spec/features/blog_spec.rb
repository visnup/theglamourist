require 'spec_helper'

describe 'reading the blog', type: :feature do
  let!(:post) { FactoryGirl.create :post }

  it 'should show me blog entries' do
    VCR.use_cassette 'should show me the blog entries' do
      visit '/'
      expect(page).to have_content(post.description)

      click_on 'Blog'
      expect(page).to have_content(post.html)

      click_on post.title
      expect(page).to have_content(post.title)
    end
  end
end
