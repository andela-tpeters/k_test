source "https://rubygems.org"

gem "rails", "~> 5.0.0", ">= 5.0.0.1"
gem "puma", "~> 3.0"
gem 'bootstrap-sass', '~> 3.3.6'
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "bcrypt"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "figaro"
gem "font-awesome-rails"

group :development, :test do
  gem "pry-rails"
  gem "byebug", platform: :mri
  gem 'rspec-rails', '~> 3.5'
end

group :production do
  gem "pg", "0.18.4"
end

group :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "simplecov", require: false
  gem "sqlite3"
  gem "database_cleaner"
  gem "codeclimate-test-reporter", require: false
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
