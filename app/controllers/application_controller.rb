# frozen_string_literal: true

require 'sinatra'
require 'sinatra/contrib'

class ApplicationController < Sinatra::Base
  enable :sessions

  configure do
    set :views, 'app/views'
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers do
    def current_user
      # guard clause
      User.find(session[:user_id]) if authenticated?
    end

    def authenticated?
      session[:user_id] ? true : false
    end

    def protected!
      halt 401, 'Sem autorização para acessar essa página' unless authenticated?
    end
  end
end
