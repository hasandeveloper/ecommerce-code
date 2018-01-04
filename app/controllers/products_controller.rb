class ProductsController < ApplicationController


  before_action :authenticate_user!, except: [:index,:show]
 load_and_authorize_resource

   def index
     @product=Product.all
   end

   def new
     @product=Product.new
     if params[:category_id]
       @product[:category_id]=params[:category_id]
   end
 end

   def create
     @product=Product.new(product_params)
     if @product.save
       redirect_to products_path
     else
       render action: 'new'
     end
   end

   def show
     @product=Product.find(params[:id])
     @review=Review.new
   end

   def edit
     @product=Product.find(params[:id])
end

def update
  @product=Product.find(params[:id])
  @product.update_attributes(product_params)
  if @product.save
    redirect_to product_path(@product.id)
  else
    render action: 'edit'
end
end

def destroy
  @product=Product.find(params[:id])
  @product.destroy
  redirect_to products_path
end

private
def product_params
  params[:product].permit(:name, :description, :price, :image, :cod_eligible, :stock, :category_id)
end

end
