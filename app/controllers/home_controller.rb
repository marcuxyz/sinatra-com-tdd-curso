require 'sinatra'

class HomeController < ApplicationController
  get '/' do
    @posts = Post.all
    erb :home, :layout => :base
  end
end