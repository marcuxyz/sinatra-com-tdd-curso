require 'sinatra'
require 'sinatra/contrib'

class ApplicationController  < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    set :views, 'app/views'
  end
end