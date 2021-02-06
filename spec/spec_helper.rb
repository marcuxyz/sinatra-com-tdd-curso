require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'bundler/setup'


ENV["RACK_ENV"] = "testing"
Bundler.require :default, ENV["RACK_ENV"].to_sym

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