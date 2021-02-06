require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'rspec'
require 'rack/test'
require 'require_all'
require 'mongoid'

require_all('app/models')
Mongoid.load!('config/mongoid.yaml', :testing)

RSpec.configure do |config| 
  config.include Capybara::DSL
  config.before(:each) do
    Mongoid.purge!
  end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app