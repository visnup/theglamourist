source 'https://rubygems.org'

gem 'active-model-email-validator'
gem 'actionpack-page_caching'
gem 'backbone-rails'
gem 'coffee-rails'
gem 'formtastic'
gem 'jquery-rails'
gem 'rails', '4.0.0.rc1'
gem 'rdiscount'
gem 'slim'
gem 'sqlite3'
gem 'stylus', branch: 'rails_4', github: 'lucasmazza/ruby-stylus'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano', require: false
  #gem 'debugger', require: false
  gem 'passenger'
end

group :test do
  gem 'factory_girl_rails'
  gem 'fakeweb'
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'vcr'
end

group :production do
  gem 'dalli'
  gem 'rack-cache'
end
