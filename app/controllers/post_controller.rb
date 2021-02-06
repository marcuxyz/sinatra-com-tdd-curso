require 'sinatra'

class PostController < ApplicationController
  get '/post/:id' do |id|
    @post = Post.find(id)
    erb :post
  end

  get '/post/deletar/:id' do |id|
    if Post.where(_id: id).delete
      return redirect to '/'
    end
    erb :post
  end

  get '/postagem/nova' do
    @users = User.all
    @categories = Category.all

    erb :new_post
  end

  post '/post/enviar' do
    @post = Post.new(params)

    if @post.save
      return redirect to '/'
    end
    
    erb :new_post
  end

end