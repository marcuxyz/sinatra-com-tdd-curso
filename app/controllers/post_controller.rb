require 'sinatra'

class PostController < ApplicationController
  get '/post/:id' do |id|
    @post = Post.find(id)
    erb :post, :layout => :base
  end

  get '/postagem/nova' do
    protected!

    @users = User.all
    @categories = Category.all

    erb :new_post, :layout => :base
  end

  post '/post/enviar' do
    protected!
  
    params[:user_id] = current_user._id.to_s
    
    @post = Post.new(params)
    
    if @post.save
      return redirect to '/'
    end
    
    erb :new_post, :layout => :base
  end

  delete '/post/:id' do |id|
    if Post.find(id).delete
      return json :id => id
    end

    json :msg => 'post não existe!'
  end

end