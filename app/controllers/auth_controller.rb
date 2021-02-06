class AuthController < ApplicationController
  get '/entrar' do
    erb :'auth/login'
  end

  post '/entrar' do
    @user = User.find_by(email: params[:email])

    unless @user
      halt 400, 'dados inválidos'
    end

    unless @user.password == params[:password]
      halt 400, 'dados inválidos'
    end
    
    # ensure that one uniq user only do login on system
    session.clear
    
    session[:user_id] = @user.id
      
    redirect to '/'
  end
end