require 'mongoid'
require 'require_all'
require 'byebug'
require 'sinatra'

ENV['RACK_ENV'] = 'development'
Bundler.require :default, ENV['RACK_ENV'].to_sym

configure :development do
  Mongoid.load! 'config/mongoid.yaml', :development
end

configure :testing do
  Mongoid.load! 'config/mongoid.yaml', :testing
end

require_all('app')
