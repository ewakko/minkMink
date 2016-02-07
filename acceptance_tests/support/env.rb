require 'rspec-expectations'
require "json"
require 'rest-client'

$timestamp = DateTime.now.strftime("%m%d%H%M")

class CustomWorld

  def initialize
    @@logger = Logger.new(STDOUT)
  end

  def logger
    @@logger
  end

end

World do
  CustomWorld.new
end
