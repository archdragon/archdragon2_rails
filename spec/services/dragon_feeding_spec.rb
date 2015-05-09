require_relative '../../lib/arch_service/arch_service'
require_relative '../../app/services/dragon_feeding_service'
require_relative '../../app/models/dragon'

describe DragonFeedingService do
  # How to describ services, when they have .call only?

  FoodItem = Class.new

  context "with proper dragon and food" do
    let(:dragon)   { Dragon.new }
    let(:foodItem) { FoodItem.new }
    it "can feed the dragon only once per day" do
      feeding_service = DragonFeedingService.call!(dragon: dragon, foodItem: foodItem)
      expect(feeding_service).to be_kind_of(ArchService::Response::Success)
    end
  end
end