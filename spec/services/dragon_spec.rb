describe DragonFeedingService do
  # How to describ services, when they have .call only?

  Dragon = Class.new
  Food = Class.new

  context "with proper dragon and food" do
    before do
      @dragon = Dragon.new
      @food = Food.new
    end
    it "can feed the dragon only once per day" do
      feeding_service = DragonFeedingService.call!(dragon: dragon, food: food)
    end
  end
end
