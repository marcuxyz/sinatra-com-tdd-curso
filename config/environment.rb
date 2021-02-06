require 'mongoid'
require 'require_all'
require 'byebug'


Mongoid.load!('config/mongoid.yaml', :development)


require_all('app')
