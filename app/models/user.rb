class User < ActiveRecord::Base
  has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :current_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def current_cart
    Cart.find(self.id)
    rescue ActiveRecord::RecordNotFound
    cart = nil#Cart.create(user_id: self.id)
    # session[:cart_id] = cart.id
    # cart
  end       
       
            
end
