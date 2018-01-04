class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates_presence_of :body, :rating
  validates_length_of :body, within: 1..200
end
