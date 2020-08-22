Capybara.javascript_driver = :selenium
Capybara.default_driver = :selenium
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: [
          "--no-default-browser-check",
          "--start-maximized"
        ]
      }
    )
  )
end