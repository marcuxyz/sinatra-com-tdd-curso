# frozen_string_literal: true

class PostController < ApplicationController
  get '/post/:id' do |id|
    @post = Post.find(id)
    erb :'post/single', layout: :base
  end

  get '/postagem/nova' do
    protected!

    @categories = Category.all
    @users = User.all
    erb :'post/new', layout: :base
  end

  post '/post/salvar' do
    protected!

    params[:user_id] = current_user.id

    @post = Post.new(params)

    return redirect to '/' if @post.save!

    erb :'post/new', layout: :base
  end

  delete '/post/:id' do |id|
    protected!

    return json id: id if Post.find(id).delete

    json msg: 'post não existe!'
  end
end
