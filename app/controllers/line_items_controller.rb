class LineItemsController < ApplicationController


  def create
    current_user.create_cart.save
    current_user.current_cart.add_item(params[:item_id]).save
    current_user.current_cart.save
    current_user.save
    redirect_to cart_path(current_user.current_cart)
  end
end