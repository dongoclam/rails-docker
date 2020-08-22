require "capybara/dsl"

class Crawlers::Tiktok::Post
  include Capybara::DSL

  Capybara.run_server = false
  Capybara.default_driver = :webkit
  Capybara.javascript_driver = :webkit
  Capybara.app_host = "https://tiktok.com"
  
  def perform
  end
end
