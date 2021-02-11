# frozen_string_literal: true

class CategoryController < ApplicationController
  get '/categoria/nova' do
    protected!

    erb :'categoria/new', layout: :base
  end

  post '/categoria/salvar' do
    protected!

    @category = Category.new(params)

    return redirect to '/' if @category.save!

    erb :'categoria/new', layout: :base
  end
end
