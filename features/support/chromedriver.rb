require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)
end

Capybara.default_driver = Capybara.javascript_driver = :chrome