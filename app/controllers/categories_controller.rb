class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  	load_and_authorize_resource
    
def index
     @categories=Category.all
end


def new
  @categories=Category.new
end


def  create
    @categories=Category.new(param)
    if @categories.save
      redirect_to categories_path
    else
      render action: 'new'
    end
end


def show
  @categories=Category.find(params[:id])
end


def destroy
  @categories=Category.find(params[:id])
  @categories.destroy
  redirect_to categories_path
end


def edit
  @categories=Category.find(params[:id])
end


def update
  @categories=Category.find(params[:id])
  @categories.update_attributes(param)
  if @categories.save
  redirect_to category_path(@categories.id)
else
  render action: 'new'
end
end


private
def param
  params[:category].permit(:name, :description)
end

end
