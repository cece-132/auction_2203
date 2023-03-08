require 'pry'
require 'date'

class Auction
  attr_reader :items, :created_on

  def initialize
    @items = []
    @created_on = DateTime.now
  end

  def date
    @created_on.strftime('%d/%m/%y')
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
    @items.map do |item|
      item if item.bids.empty?
    end.compact
  end

  def potential_revenue
    @items.sum do |item|
      item.current_high_bid
    end
  end

  def bidders
    names = []
    @items.each do |item|
      item.bids.each do |attendee, bid|
        names << attendee.name
      end
    end
    names.uniq
  end

  def bidder_info
    info = attendee_hash
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if !info[attendee][:items].include?(item)
          info[attendee][:items] << item
        else
          info[attendee][:items] << item
        end
      end
    end
    info
  end

  def attendee_hash
    hash = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        hash[attendee] = {budget: attendee.budget, items: []}
      end
    end
    hash
  end

  def close_auction
    hash = {}
    @items.each do |item|
      if item.attendee_current_high_bid.nil?
        hash[item] = 'Not Sold'
      else
        hash[item] = item.attendee_current_high_bid
      end
    end
    hash
  end

end
