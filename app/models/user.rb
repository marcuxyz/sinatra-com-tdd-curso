require 'mongoid'

class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :password, type: String

  has_many :posts
end