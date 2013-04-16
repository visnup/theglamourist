source 'https://rubygems.org'

gem 'active-model-email-validator'
gem 'formtastic'
gem 'rails'
gem 'rdiscount'
gem 'slim'
gem 'sqlite3'

group :assets do
  gem 'backbone-rails'
  gem 'coffee-rails'
  gem 'eco'
  gem 'jquery-rails'
  gem 'stylus'
  gem 'uglifier'
end

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano', require: false
  #gem 'debugger', require: false
  gem 'thin'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'fakeweb'
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'vcr'
end

group :production do
  gem 'dalli'
end
