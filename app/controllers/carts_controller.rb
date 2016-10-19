class CartsController < ApplicationController

  def show
    #binding.pry
    #@new_line_item = LineItem.new
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |l_item|
      l_item.item.inventory -= l_item.quantity 
    end
    clear_cart
    redirect_to user_path(current_user), notice: 'Successfully checked out!'
  end

  private

  def clear_cart
    @cart.destroy 
  end

end
