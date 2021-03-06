class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable


  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def create_cart
    self.current_cart ||= Cart.new
  end

end