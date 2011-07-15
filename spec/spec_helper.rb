require 'rubygems'
require 'rspec'
require 'mocha'
require 'test/unit'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end
