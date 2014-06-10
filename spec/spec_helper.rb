require 'rspec'
require_relative '../app/node_tree'
require_relative '../app/tree'
require_relative '../app/valid_tree'


RSpec.configure do |config|

  config.order = :random
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.mock_with :rspec
end
