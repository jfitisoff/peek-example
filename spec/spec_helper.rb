require "insite"
require "factory_bot"
require "faker"
require "rspec/wait"
require "yaml"
require 'rspec/retry'

RSpec.configure do |config|
  config.add_formatter :documentation
  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.around :each do |ex|
    ex.run_with_retry retry: 2
  end
end

PROD_BASE_URL = "https://www.peek.com/"

require_relative "support/site/site"

[
  "/support/site/components/*.rb",
  "/support/site/pages/*.rb",
  "/support/site/utils/*.rb"
].each do |pattern|
  Dir[File.expand_path(File.dirname(__FILE__)) + pattern].each do |path|
    require path
  end
end
