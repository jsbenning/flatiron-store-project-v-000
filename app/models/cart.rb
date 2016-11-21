class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    sum = 0
    self.line_items.each do |x|
      l_price = (x.item.price * x.quantity)
      sum += l_price
    end
    sum.to_f/100
    # self.line_items.each do |x| 
    #   x.item.price.inject(0){|sum,x| sum + x } I tried to be Rubyish, alas
    # end
  end

  def add_item(some_item_id)
    item = Item.find(some_item_id)
    my_line_item = self.line_items.find{ |old_item| old_item.item.id == item.id }
    if my_line_item.nil?
      my_line_item = LineItem.new(item_id: item.id)#, cart_id: self.id)
      self.line_items << my_line_item # hmm
    else
      my_line_item.quantity += 1
      my_line_item.save
    end
    #self.save
    my_line_item
  end

  # def add_item(item_id)
  #   line_item = self.line_items.find_by(item_id: item_id)
  #   if line_item
  #     line_item.quantity += 1
  #     line_item.save
  #   else
  #     line_items.build(item_id: item_id)
  #   end
  # end

  # def add_item(item_id)
  #   line_item = self.line_items.find_by(item_id: item_id)
  #   if line_item
  #     line_item.quantity += 1
  #     line_item.save
  #   else
  #     line_item = self.line_items.build(item_id: item_id)
  #     #binding.pry
  #   end
  #   #self.save
  #   #line_item
  # end


   def clear_cart(cart)
    if cart
      cart.destroy 
    end
  end
end
