require_relative '../../lib/arch_service/arch_service'
require_relative '../../app/services/dragon_feeding_service'
require_relative '../../app/models/dragon'

describe DragonFeedingService do
  # How to describe services, when they have .call only?

  FoodItem = Class.new

  context 'with proper dragon and food' do
    let(:dragon)   { Dragon.new }
    let(:foodItem) { FoodItem.new }

    context 'if the dragon didn\'t eat anything today' do
      before do
        allow(dragon).to receive(:feeding_time) { Time.new(1900) }
      end
      it 'feeds the dragon' do
        feeding_service = DragonFeedingService.call!(dragon: dragon, foodItem: foodItem)
        expect(feeding_service).to be_kind_of(ArchService::Response::Success)
      end
    end

    context 'if the dragon ate something today' do
      before do
        allow(dragon).to receive(:feeding_time) { Time.now }
      end
      it 'returns an error' do
        feeding_service = DragonFeedingService.call!(dragon: dragon, foodItem: foodItem)
        expect(feeding_service).to be_kind_of(ArchService::Response::Error)
      end
    end
  end
end
