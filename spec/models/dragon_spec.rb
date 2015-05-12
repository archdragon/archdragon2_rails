require_relative '../../app/models/dragon'

describe Dragon do
  describe "#new" do
    it "Has no hunger" do
      dragon = Dragon.new
      expect(dragon.hunger_level).to be 0
    end
  end
  describe "#hunger_level" do
    it "Grows when the dragon gets more hungry" do
      dragon = Dragon.new
      dragon.satiate!
      expect{ dragon.make_hungry! }.to change{ dragon.hunger_level }.from(0).to(100)
    end
  end
end

