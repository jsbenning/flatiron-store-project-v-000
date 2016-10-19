class LineItemsController < ApplicationController

  def create
    #binding.pry
    # new_line_item = current_cart.line_items.find{ |old_item| old_item.id == params[:id]}
    # if new_line_item.nil?
    #   new_line_item = LineItem.create(item_id: params[:item_id])
    # end
    #@line_item_id = params[:id]
    current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_cart)
  end
end

