# frozen_string_literal: true

require 'mongoid'
require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include BCrypt

  field :name, type: String
  field :email, type: String
  field :password_hash, type: String

  has_many :posts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
