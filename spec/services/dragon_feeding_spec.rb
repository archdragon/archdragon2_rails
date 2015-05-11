require_relative '../../lib/arch_response/arch_response'
require_relative '../../lib/arch_service/arch_service'
require_relative '../../app/services/feed_dragon_service'
require_relative '../../app/models/dragon'
require_relative '../../app/models/food_item'

class RemoveItemService < ArchService::Base
  def self.call!(item:, user:, count:)
  end
end

describe FeedDragonService do
  context 'when called with valid dragon and item' do
    let(:dragon)    { Dragon.new }
    let(:food_item) { FoodItem.new }

    it 'removes the item' do
      removal = spy(RemoveItemService)
      FeedDragonService.call!(
        dragon: Dragon.new,
        food_item: FoodItem.new,
        removal_service: removal
      )
      expect(removal).to have_received(:call!) { ArchResponse::Success.new }
    end
    context 'if the dragon is hungry' do
      before do
      end

      it 'makes it less hungry' do
        expect(dragon).to have_received(:call!) { ArchResponse::Success.new }
      end
    end
  end
end

