require 'sinatra'

class HomeController < ApplicationController
  get '/' do
    @posts = Post.all
    erb :home
  end
end