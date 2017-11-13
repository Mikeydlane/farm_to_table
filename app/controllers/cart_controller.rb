class CartController < ApplicationController

  def index
    @cart = cart
  end

  def add
    if cart.has_key?(params[:id])
      cart[params[:id]] += 1
    else
      cart[params[:id]] = 1
    end

    redirect_back(fallback_location: farmers_path)
  end
end
