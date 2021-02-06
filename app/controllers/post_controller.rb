require 'sinatra'

class PostController < ApplicationController
  get '/post/:id' do
    @post = Post.find(params[:id])
    erb :post
  end

  get '/post/deletar/:id' do
    if Post.where(_id: params[:id]).delete
      return redirect to '/'
    end
    erb :post
  end

  get '/postagem/nova' do
    @user = User.first
    erb :new_post
  end

  post '/post/enviar' do
    @post = Post.new(params)
    byebug
    if @post.save
      return redirect to '/'
    end

    erb :new_post
  end
end