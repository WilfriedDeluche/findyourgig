source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'pg'

gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
gem "thin"

gem 'jquery-rails'

gem 'devise'
gem 'rolify'

gem 'json'

gem 'geocoder'
gem 'gmaps4rails'

gem 'carmen', git: 'git://github.com/jim/carmen.git'
gem 'carmen-rails', git: 'git://github.com/jim/carmen-rails.git'

gem 'carrierwave'
gem 'rmagick'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'linecache19', '0.5.13'
  gem 'ruby-debug-base19', '0.11.26'
  gem 'ruby-debug19', :require => 'ruby-debug'

  # Execute this gist to install linecache and ruby-debug-base19 properly with ruby 1.9.3
  # bash < <(curl -L https://raw.github.com/gist/1333785) 

  # Rspec, Factory Girl, Database Cleaner and Guard related gems
  gem "rspec-rails", "~> 2.0"
  gem 'rspec-instafail'
  gem 'rspec-mocks'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'pry'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-migrate"
end

group :test do
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem 'simplecov'
end
