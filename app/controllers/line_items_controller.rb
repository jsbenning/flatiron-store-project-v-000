class LineItemsController < ApplicationController

  def create
    if current_cart
      current_cart.add_item(params[:item_id])
      redirect_to cart_path(current_cart)
    else 
      @cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @cart.id
      redirect_to cart_path(@cart)  
    end
  end
end

