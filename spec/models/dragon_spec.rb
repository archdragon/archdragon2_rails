require_relative '../light_helper'

describe Dragon do
  let(:dragon) { dragon = Dragon.new(user: User.new) }
  describe '#new' do
    it 'is not hungry' do
      expect(dragon.hunger_level).to be 0
    end
  end
  describe '#hunger_level' do
    it 'grows when the dragon gets more hungry' do
      dragon.satiate!
      expect{ dragon.make_hungry! }.to change{ dragon.hunger_level }.from(0).to(100)
    end
  end
end

