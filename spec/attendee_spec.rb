require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@attendee).to be_a(Attendee)
      expect(@attendee.name).to be_a String
      expect(@attendee.name).to eq('Megan')
      expect(@attendee.budget).to be_a Integer
      expect(@attendee.budget).to eq(50)
    end
  end

end
