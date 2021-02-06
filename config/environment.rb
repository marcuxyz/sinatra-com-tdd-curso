require 'require_all'
require 'mongoid'


Mongoid.load!('config/mongoid.yaml', :development)


require_all('app')
