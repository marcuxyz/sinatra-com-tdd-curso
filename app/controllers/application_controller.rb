# frozen_string_literal: true

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
      return User.find(session[:user_id]) if authenticated?
    end

    def authenticated?
      session[:user_id] ? true : false
    end

    def protected!
      halt 401, "Sem autorização\n" unless authenticated?
    end
  end
end
