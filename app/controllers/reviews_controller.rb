class ReviewsController < ApplicationController

  before_action :authenticate_user!
	load_and_authorize_resource

  def create
    @review=Review.new(review_params)
    @review.user_id=current_user.id
    if @review.save
      redirect_to product_path(@review.product_id)

end
end

 def destroy
   @review=Review.find(params[:id])
   @review.destroy
   redirect_to product_path(@review.product_id)
 end

 def show
   @review=Review.find(params[:id])
 end

 def edit
   @review=Review.find(params[:id])
 end

 def update
   @review=Review.find(params[:id])
   @review.update_attributes(review_params)
   redirect_to product_path(@review.product_id)
 end

 private

 def review_params
   params[:review].permit(:body, :product_id, :rating)
 end
end
