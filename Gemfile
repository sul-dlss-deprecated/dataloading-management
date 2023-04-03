source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "config"
gem "cssbundling-rails"
gem "devise"
gem "devise-remote-user"
gem "folio_client"
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "okcomputer"
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "propshaft" # The successor to sprockets for asset-serving needs
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

group :development, :test do
  gem "byebug"
  gem "rspec"
  gem "rspec-rails"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "rspec_junit_formatter"
  gem "simplecov", require: false
  gem "standard"
end

group :development do
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]
end
