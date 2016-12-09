module ApplicationHelper

  def current_cart
    current_user.current_cart ||= Cart.create
  end
end
