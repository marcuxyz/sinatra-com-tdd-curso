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
end