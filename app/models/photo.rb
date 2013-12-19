class Photo < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :comments, as: :commentable
end
