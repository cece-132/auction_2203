class Item
  attr_reader :name, :bids, :open_bid

  def initialize(name)
    @name = name
    @bids = {}
    @open_bid = true
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount if @open_bid
  end

  def current_high_bid
    high_bid = @bids.max_by { |attendee, amount| amount }
    if high_bid.nil?
      return 0
    else
      high_bid[1]
    end
  end

  def attendee_current_high_bid
    high_bid = @bids.max_by { |attendee, amount| amount }
    if high_bid.nil?
      nil
    else
      high_bid[0]
    end
  end

  
  def close_bidding
    @open_bid = false
  end

end
