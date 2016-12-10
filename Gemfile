source "https://rubygems.org"

ruby "2.3.3"
gem "rails", "5.0.0.1"

# Rails
gem "bcrypt", "3.1.11"
gem "devise", "4.2.0"
gem "faker", "1.6.6"
gem "figaro", "1.1.1"
gem "mandrill-api", "1.0.53"
gem "pg", "0.19.0"
gem "pundit", "1.1.0"
gem "redis-rails", "5.0.1"
gem "rollbar", "2.13.3"
gem "sass-rails", "5.0.6"
gem "settingslogic", "2.0.9"
gem "sidekiq", "4.2.7"
gem "sinatra", "2.0.0.beta2"
gem "uglifier", "3.0.4"

# JavaScript
gem "jquery-rails", "4.2.1"
gem "lodash-rails", "4.17.2"
gem "rails_jskit", "5.1.5"

group :production, :staging do
  gem "puma", "3.6.2"
end

group :development, :test do
  gem "brakeman", "3.4.1", require: false
  gem "bundler-audit", "0.5.0", require: false
  gem "byebug", "9.0.6"
  gem "factory_girl_rails", "4.7.0"
  gem "hakiri", "0.7.2", require: false
  gem "magic_lamp", "1.8.1"
  gem "pry-rails", "0.3.4"
  gem "pry-remote", "0.1.8"
  gem "rubocop", "0.46.0"
  gem "teaspoon-mocha", "2.3.3"
end

group :development do
  gem "letter_opener_web", "1.2.0"
  gem "listen", "3.1.5"
  gem "rails_db", "1.3.4"
  gem "web-console", "3.4.0"
end

group :test do
  gem "capybara", "2.10.2"
  gem "coffee-script"
  gem "database_cleaner", "1.5.3"
  gem "pundit-matchers", "1.1.0"
  gem "rspec-instafail", "1.0.0", require: false
  gem "rspec-json_expectations", "1.4.0"
  gem "rspec-rails", "3.5.2"
  gem "rspec-sidekiq", "2.2.0"
  gem "rspec_junit_formatter", "0.2.3"
  gem "rubocop-rspec", "1.8.0"
  gem "selenium-webdriver", "3.0.3"
  gem "shoulda-matchers", "3.1.1"
end
