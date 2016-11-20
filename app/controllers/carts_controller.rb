class CartsController < ApplicationController

  def show
    #binding.pry
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |l_item|
      l_item.item.inventory -= l_item.quantity 
      l_item.item.save
    end
    @cart.status = 'complete'
    @cart.save
    #current_cart = nil
  
    redirect_to cart_path(@cart), notice: 'Successfully checked out!'
  end
end


