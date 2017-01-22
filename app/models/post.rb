class Post < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments
end
