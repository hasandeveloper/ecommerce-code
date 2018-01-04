
class CartLineItemsController < ApplicationController


  def index
  # CartLineItem.where('user_id = ?', current_user.id)
  @cart_line_items = current_user.cart_line_items # to find only the cart line items for that currently logged in user
end


  def create
  		@cart_line_item = CartLineItem.new(cart_line_item_params)
  		@cart_line_item.user_id = current_user.id

      details={user: current_user.id, product: @cart_line_item.product_id }
  		if @cart_line_item.save_or_update(details)
        redirect_to cart_line_items_path, notice: "succesfully Added to Cart"
  	end
  end

    def destroy
            @cart_line_item =CartLineItem.find(params[:id])

      @cart_line_item.destroy
      redirect_to cart_line_items_path
    end

    def update
      @cart_line_item = CartLineItem.find(params[:id])
      if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
        redirect_to cart_line_items_path
      end
    end


  	private

  	def cart_line_item_params
  		params[:cart_line_item].permit(:quantity, :product_id)
  	end




end
