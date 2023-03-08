class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    high_bid = @bids.max_by { |attendee, amount| amount }
    if high_bid.nil?
      return 0
    else
      high_bid[1]
    end
  end

end
