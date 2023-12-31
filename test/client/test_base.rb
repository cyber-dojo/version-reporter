# frozen_string_literal: true
require_relative '../id58_test_base'
require 'capybara/minitest'
require 'selenium-webdriver'
require_source 'app'
require_source 'externals'

class TestBase < Id58TestBase

  include Capybara::DSL
  include Capybara::Minitest::Assertions
  include Rack::Test::Methods # [1]

  chrome_options = Selenium::WebDriver::Chrome::Options.new

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      # :browser_name => :chrome,
      :url => 'http://selenium:4444/wd/hub',
      # desired_capabilities: :firefox,
      :options => chrome_options
    )
  end

  def setup
    Capybara.app_host = 'http://nginx:80'
    Capybara.javascript_driver = :selenium
    Capybara.current_driver    = :selenium
    Capybara.run_server = false
    Capybara.default_driver    = :remote_chrome
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.app_host = nil
  end

  # - - - - - - - - - - - - - - - - - - -

  def initialize(arg)
    super(arg)
  end

  def externals
    @externals ||= Externals.new
  end

  def app
    App.new(externals)
  end

end
