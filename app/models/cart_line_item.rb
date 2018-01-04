

  class CartLineItem < ApplicationRecord
  validates_presence_of :product_id, :user_id, :quantity
  belongs_to :product
 belongs_to :user

 def save_or_update(details)

line_item = CartLineItem.find_by(user_id: details[:user], product_id: details[:product])
if line_item.nil?
  self.save
else
  line_item.update_attributes(quantity: line_item.quantity + self.quantity)
end

 end

end
