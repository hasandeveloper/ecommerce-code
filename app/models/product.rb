class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :wishlists
  has_many :order_line_items

  has_many :cart_line_items
  validates_presence_of :name, :description, :price, :image, :stock, :category_id
  validates_uniqueness_of :name
  validates_length_of :description, within: 1...1000

end
