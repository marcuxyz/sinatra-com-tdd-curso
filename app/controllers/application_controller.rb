require 'sinatra'
require 'sinatra/contrib'

class ApplicationController < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    set :views, 'app/views'
  end

  helpers do
    def current_user
      return User.find(session[:user_id]) if is_authenticated?
    end

    def is_authenticated?
      session[:user_id]? true : false
    end

    def protected!
      unless is_authenticated?
        halt 401, "Sem autorização\n"
      end
    end
  end
end
