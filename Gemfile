# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.0"

# Use PostgreSQL as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 4.1"

# Monitor the performance with Skylight
gem "skylight"

# Track errors on honeybadger.io
gem "honeybadger", "~> 4.0"

# Transpile app-like JavaScript.
# Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

# Build JSON APIs with ease.
# Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Authenticate users with email and password
gem "clearance"

# Authorize users with rules written in plain ol' Ruby
gem "pundit"

gem "high_voltage"

group :development, :test do
  # Call 'byebug' anywhere to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # Enforce a consistent Ruby style
  gem "rubocop", require: false
  gem "rubocop-rails", require: false

  # Scan the code for security vulnerabilities
  gem "brakeman", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"

  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem "web-console", ">= 3.3.0"

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "timecop"

  # Measure test coverage and report it to CodeCov from CI
  gem "codecov", require: false
  gem "simplecov", require: false

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
