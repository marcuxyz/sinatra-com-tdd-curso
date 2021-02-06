class AuthController < ApplicationController
  get '/entrar' do
    erb :'auth/login'
  end

  post '/entrar' do
    @user = User.find_by(email: params[:email])

    halt 400, 'dados inválidos' unless @user

    halt 400, 'dados inválidos' unless @user.password == params[:password]

    # ensure that one uniq user only do login on system
    session.clear

    session[:user_id] = @user.id

    redirect to '/'
  end

  get '/sair' do
    session.clear
    redirect to '/'
  end
end
