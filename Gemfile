source "https://rubygems.org"
ruby "3.3.6"

gem "pg"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false
gem "dry-operation"
gem "dry-rails", "~> 0.3"
gem "kamal", require: false
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "thruster", require: false

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'rspec-rails', '~> 7.1.0'
  gem "rubocop-rails-omakase", require: false
  gem "pry-rails"
  gem "pry-byebug"
  gem 'factory_bot_rails'
end