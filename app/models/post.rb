require 'mongoid'

class Post
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :status, type: String
  field :category, type: String

  validates :title, :content, :category, :status, :presence => true
  validates :title, :uniqueness => true, :length => { maximum: 120 }
  validates :content, :length => { minimum: 10 }

  belongs_to :user
end