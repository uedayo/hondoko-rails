source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.rc1'

# Use mysql as the database for Active Record
gem 'mysql2'

group :development, :test do
  gem 'rspec-rails'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

group :development do
  # N+1 problem
  gem "bullet"
end

group :production do
  # Use unicorn as the app server
  gem 'unicorn'
  # New Relic
  gem 'newrelic_rpm'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'amazon-ecs'

group :test do
  gem 'factory_girl_rails', '~> 4.0'
end

gem 'active_decorator'

gem 'quiet_assets'

gem 'haml-rails'

gem 'simple_form'

gem 'bootstrap-sass', '~> 3.1.1', github: 'uedayo/bootstrap-sass'
