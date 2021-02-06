require 'mongoid'

class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :email, type: String
  field :password, type: String

  has_many :posts
end