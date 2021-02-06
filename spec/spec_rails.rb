require 'rack/test'
require 'capybara/rspec'
require 'rspec'
require 'require_all'
require 'mongoid'

require_all('app/controllers')
require_all('app/models')

Mongoid.load!('config/mongoid.yaml', :testing)

RSpec.configure do |config| 
  config.before(:each) do
    Mongoid.purge!
  end
end

module RSpecMixin
  include Rack::Test::Methods
end