require './lib/item'

RSpec.describe Item do
  before :each do

    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@item1).to be_a(Item)
      expect(@item1.name).to be_a String
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
  end
end
