class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(cart_id: self.id, item_id: item)
    end
    line_item
  end

  def total
    sum = 0
    self.line_items.each do |l_item|
      l_price = (l_item.item.price * l_item.quantity)
      sum += l_price
    end
    sum.to_f/100
  end

end
