class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :cart_count, :cart_total

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user
      redirect_to current_user unless current_user.id == params[:id].to_i
    end
  end

  def cart
    if session[:cart].nil?
      session[:cart] = {}
    else
      session[:cart]
    end
  end

  def cart_count
    cart.reduce(0) do |a, (id, quantity)|
      a += quantity
    end
  end

  def cart_total
    cart.reduce(0) do |a, (id, quantity)|
      a += quantity * Product.find(id).price
    end
  end
end
