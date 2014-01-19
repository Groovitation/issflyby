require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new
  profile["download.default_directory"] = DownloadHelpers::PATH.to_s
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)
end

Capybara.default_driver = Capybara.javascript_driver = :chrome