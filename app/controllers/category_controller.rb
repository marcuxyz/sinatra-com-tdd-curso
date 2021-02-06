# frozen_string_literal: true

class CategoryController < ApplicationController
  before '/categoria/*' do
    protected!
  end

  get '/categoria/nova' do
    erb :new_category, layout: :base
  end

  post '/categoria/enviar' do
    @category = Category.new(params)

    redirect to '/' if @category.save!

    erb :new_category, layout: :base
  end
end
