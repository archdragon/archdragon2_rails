require 'active_model'
require_relative '../../lib/arch_form/arch_form'
require_relative '../../app/forms/dragon_feeding_form'
require_relative '../../app/models/dragon'

describe DragonFeedingForm do

  FoodItem = Class.new

  context 'with proper dragon and food' do
    let(:dragon)   { Dragon.new }
    let(:food_item) { FoodItem.new }

    context 'if the dragon didn\'t eat anything today' do
      before do
        allow(dragon).to receive(:feeding_time) { Time.new(1900) }
      end
      it 'feeds the dragon' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
      end
      it 'works without error' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(Arch::Response::Success)
      end
    end

    context 'if the dragon ate something today' do
      before do
        allow(dragon).to receive(:feeding_time) { Time.now }
      end
      it 'returns an error' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(ArchResponse::Error)
      end
    end
  end
end

