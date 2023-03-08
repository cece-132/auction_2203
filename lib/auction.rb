require 'pry'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end    
  end

  def unpopular_items
    items.map do |item|
      item if item.bids.empty?
    end.compact
  end

  def potential_revenue
    @items.sum do |item|
      item.current_high_bid
    end
  end

end
