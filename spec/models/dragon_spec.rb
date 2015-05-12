require_relative '../../app/models/dragon'
require_relative '../../app/models/user'

describe Dragon do
  let(:dragon) { dragon = Dragon.new(user: User.new) }
  describe "#new" do
    it "Has low hunger" do
      expect(dragon.hunger_level).to be 0
    end
  end
  describe "#hunger_level" do
    it "Grows when the dragon gets more hungry" do
      dragon.satiate!
      expect{ dragon.make_hungry! }.to change{ dragon.hunger_level }.from(0).to(100)
    end
  end
end

