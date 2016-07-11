source 'https://rubygems.org'

source 'http://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.3.1'
end

ruby '2.2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'rails-api'
gem 'rails-env'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x
gem 'responders', '~> 2.0'

gem 'rack-attack'

gem 'pg'
gem 'schema_plus_views'
gem 'composite_primary_keys', '<9'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'ruby_dig'

gem 'le'
gem 'rollbar'
gem 'oj'

gem 'holidays' # https://github.com/alexdunae/holidays

gem 'enum_help'

# Better forms
gem 'nested_form'
gem 'simple_form'
gem 'i18n_generators'

# Paginators
gem 'kaminari'
gem 'has_scope'

# Attribute Helpers
gem 'attribute_normalizer'

# Additional serializer helper
gem 'active_model_serializers', '~> 0.10.0.rc2'

group :development do
  # Add a comment summarizing the current schema
  gem 'annotate'

  # Checks SQL queries' health
  gem 'bullet'

  gem 'foreman'
  gem 'quiet_assets'
  gem 'web-console', '~> 2.0'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'timecop'
  gem 'factory_girl_rails'
  gem 'factory_girl-preload'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'spring'
  gem 'pry'
end

group :development, :staging, :test do
  gem 'faker'
  gem 'ffaker'
  gem 'awesome_print'
end

group :test do
  gem 'simplecov'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'test_notifier', require: false
  gem 'fuubar'
end

group :staging, :production do
  gem 'passenger', '= 4.0.59'
end
