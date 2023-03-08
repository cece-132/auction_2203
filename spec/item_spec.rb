require './lib/item'
require './lib/auction'
require './lib/attendee'


RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @auction = Auction.new

    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@item1).to be_a(Item)
      expect(@item1.name).to be_a String
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to be_a Hash
      expect(@item1.bids).to be_empty
    end
  end

  describe '#add_bid(attendee, amount)' do
    it 'can add a bid to an item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({ @attendee2 => 20, @attendee1 => 22})
    end
  end

  describe '#current_high_bid' do
    it 'returns the amount of the highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to be_a Integer
      expect(@item1.current_high_bid).to eq 22
    end
  end


end
