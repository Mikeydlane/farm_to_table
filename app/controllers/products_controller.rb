class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit, :update]

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash.now[:error] = "S my D from B"
      render :new
    end
  end

  def edit
  end

  def create
    if @product.update(product_params)
      redirect_to products_path
    else
      flash.now[:error] = "S my D from B"
      render :new
    end
  end

  def destroy
    @product.destroy if @product.present?
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end
end
