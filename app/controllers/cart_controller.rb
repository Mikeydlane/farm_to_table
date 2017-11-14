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

  def checkout
    products = cart.map do |product_id, quantity|
      Product.find(product_id)
    end


    seller_ids = products.map { |p, q| p.user.id }.uniq

    orders = seller_ids.map do |seller_id|
      order_products = products.select { |p| p.user.id == seller_id }
      order = Order.create!(seller_id: seller_id, buyer_id: current_user.id)
      order_products.each do |product|
        quantity = cart[product.id.to_s]
        amount = quantity * product.price
        OrderProduct.create!(product_id: product.id, order_id: order.id, amount: amount, quantity: quantity)
      end
      order
    end

    invoice = Invoice.create(total: cart_total, user_id: current_user.id)
    orders.each do |order|
      invoice.orders << order
    end
    session[:cart] = {}
    redirect_to invoice
  end
end
