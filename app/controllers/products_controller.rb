class ProductsController < ApplicationController

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to current_user
    else
      flash.now[:error] = "S my D from B"
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end
