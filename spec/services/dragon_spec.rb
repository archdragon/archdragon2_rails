describe DragonFeedingService do
  # How to describ services, when they have .call only?
  context "with proper dragon and food" do
    before do
      @dragon = Dragon.new
      @food = Food.new
    end
    it "can feed the dragon only once per day" do
      feeding_service = DragonFeedingService.new(dragon: dragon, food: food)
      feeding_service.call!
    end
  end
end
