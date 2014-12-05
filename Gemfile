source 'https://rubygems.org'

gem 'active-model-email-validator'
gem 'actionpack-page_caching'
gem 'babosa'
gem 'coffee-rails'
gem 'crack'
gem 'formtastic'
gem 'kaminari'
gem 'rack-mobile-detect'
gem 'rails'
gem 'rdiscount'
gem 'slim'
gem 'sqlite3'
gem 'stylus'
gem 'turbolinks'
gem 'uglifier'
gem 'whenever'

group :development, :test do
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter', git: 'git@github.com:circleci/rspec_junit_formatter.git'
end

group :development do
  gem 'capistrano', '~>2', require: false
  gem 'passenger'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'dalli'
  gem 'rack-cache'
end
