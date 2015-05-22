require_relative '../light_helper'

describe FeedingTime do
  describe 'self.today' do
    it 'returns a new FeedingTime instance' do
      today = FeedingTime.today
      expect(today).to be_kind_of(FeedingTime)
    end
  end
end
