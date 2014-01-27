source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'figaro'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'sendgrid'
gem 'protected_attributes'
gem 'httparty'
gem 'geocoder'
gem 'faker'
gem 'bourbon'
gem 'neat'
gem 'ruby-sun-times', require: 'sun_times'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :test do
  gem 'mocha', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
