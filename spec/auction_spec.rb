require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before :each do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@auction).to be_a(Auction)
      expect(@auction.items).to be_a Array
      expect(@auction.items).to be_empty
    end
  end

  describe '#add_item(item)' do
    it 'can add an item to an auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1,@item2])
    end
  end
  
  describe '#item_names' do
    it "can return all the auction item names in an array" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe "Iteration II" do
    before :each do

      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')

      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      @auction = Auction.new

      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
    end

    describe '#unpopular_items' do
      it 'returns and array of items with no bids' do
        expect(@auction.unpopular_items).to eq [@item2, @item3, @item5]
        expect(@auction.unpopular_items).to_not include(@item1)
        expect(@auction.unpopular_items).to_not include(@item4)
      end
    end

    describe 'potential_revenue' do
      it 'returns the sum of the highest bids for each item' do
        @item3.add_bid(@attendee2, 15)
        expect(@auction.potential_revenue).to eq 87
      end
    end
    
  end
end
