require 'mongoid'

class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :color, type: String, default: 'primary'

  validates :name, presence: true, uniqueness: true

  has_many :posts
end
