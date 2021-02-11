# frozen_string_literal: true

require 'mongoid'

class Post
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :title, type: String
  field :content, type: String
  field :status, type: String, default: 'Publicado'

  validates :title, :content, :status, presence: true
  validates :title, uniqueness: true, length: { maximum: 120 }
  validates :content, length: { minimum: 10 }

  belongs_to :user, optional: false
  belongs_to :category, optional: false
end
