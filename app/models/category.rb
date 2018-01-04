class Category < ApplicationRecord

  has_many :products
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  validates_length_of :description, within:1..1000
end
