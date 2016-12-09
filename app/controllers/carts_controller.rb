class CartsController < ApplicationController


  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
      Item.find(line_item.item_id).decrement(:inventory, line_item.quantity).save
    end
    @cart.status = "submitted"
    @cart.save
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path(@cart)
  end
end