require 'rspec'
require_relative '../node_tree'
require_relative '../tree'


RSpec.configure do |config|

  config.order = :random
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.mock_with :rspec
end
