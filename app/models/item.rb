class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    avail = Item.all.select do |item| # avail = Item.map{|item| item.inventory > 0 } or Item.where(inventory > 0) ?
      item.inventory > 0
      end 
    avail
  end

end
