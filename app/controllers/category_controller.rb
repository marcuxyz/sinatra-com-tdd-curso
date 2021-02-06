class CategoryController < ApplicationController
  get '/categoria/nova' do
    erb :new_category, :layout => :base
  end

  post '/categoria/enviar' do
    @category = Category.new(params)

    if @category.save! 
      redirect to '/'
    end

    erb :new_category, :layout => :base
  end
end