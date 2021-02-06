require 'sinatra'

class HomeController < ApplicationController
  get '/' do
    @posts = Post.all
    @categories = Category.all
    erb :home, :layout => :base
  end
end