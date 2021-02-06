require 'mongoid'
require 'require_all'
require 'byebug'

configure :development do
  Mongoid.load! 'config/mongoid.yaml', :development
end

configure :testing do
  Mongoid.load! 'config/mongoid.yaml', :testing
end

require_all('app')
