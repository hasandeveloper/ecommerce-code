class WishlistsController < ApplicationController

  before_action :authenticate_user!

def index
  @wishlist=current_user.wishlists
end

def create
  @wishlist=Wishlist.new(wishlist_param)
  @wishlist.user_id=current_user.id
  wish_item = Wishlist.find_by(user_id: current_user.id, product_id: @wishlist.product_id)
   if wish_item.nil?
     @wishlist.save
     redirect_to wishlists_path, notice: "The product is succesfully Added"
   else
     redirect_to wishlists_path, notice: "The Product is already exist"



end
end

def destroy
  @wishlist=Wishlist.find(params[:id])
  @wishlist.destroy
  redirect_to wishlists_path
end



private

def wishlist_param
  params[:wishlist].permit(:product_id, :quantity)

end
end
