class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items



  def total
    sum = 0
    self.line_items.each do |x|
      sum += x.item.price
    end
    sum
    # self.line_items.each do |x| 
    #   x.item.price.inject(0){|sum,x| sum + x } I tried to be Rubyish, alas
    # end
  end

  def add_item(some_item_id) 
    item = Item.find(some_item_id)
    my_line_item = self.line_items.find{ |old_item| old_item.item.id == item.id }
    if my_line_item.nil?
      my_line_item = LineItem.new(item_id: item.id, cart_id: self.id) 
    else
      my_line_item.quantity += 1
      my_line_item.save
    end
    self.save
    my_line_item
  end
end
