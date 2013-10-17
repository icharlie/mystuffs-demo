source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:

gem 'devise'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk'
gem 'newrelic_rpm'
gem 'will_paginate', '~> 3.0'
gem 'acts-as-taggable-on', '~> 2.4.1'
#gem 'strong_parameters'

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'email_spec'
end

group :development, :test do
  gem 'commands'
  gem 'ruby-prof', :git => 'git://github.com/ruby-prof/ruby-prof.git'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'meta_request'
  gem 'faker'
  gem 'debugger'
end

group :production do |variable|
  gem 'pg'
  gem 'postmark-rails'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "therubyracer"
  gem "bootstrap-sass", '~> 2.3.2.1'
  gem 'font-awesome-sass-rails'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

