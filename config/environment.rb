# frozen_string_literal: true

require 'require_all'
require 'byebug'

ENV['RACK_ENV'] = 'development'
Bundler.require :default, ENV['RACK_ENV'].to_sym

configure :development do
  Mongoid.load! 'config/mongoid.yml', :development
end

configure :testing do
  Mongoid.load! 'config/mongoid.yml', :testing
end

require_all 'app'
