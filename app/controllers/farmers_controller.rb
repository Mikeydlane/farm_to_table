class FarmersController < ApplicationController

  def index
    @products = Product.all
  end

  def show
   @farmer = User.find(params[:id])
  end

end
