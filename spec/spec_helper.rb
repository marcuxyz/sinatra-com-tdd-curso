require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'bundler/setup'
require "capybara/cuprite"


RSpec.configure do |config| 
  config.include Capybara::DSL
  config.before(:each) do
    Mongoid.purge!
  end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

ENV["RACK_ENV"] = "testing"
Bundler.require :default, ENV["RACK_ENV"].to_sym


Capybara.register_driver :cuprite do |app|
  browser_options = {}.tap do |opts|
    opts['no-sandbox'] = nil if ENV['CI']
  end
  Capybara::Cuprite::Driver.new(app, browser_options: browser_options)
end

Capybara.app = app
Capybara.server = :webrick
Capybara.javascript_driver = :cuprite
