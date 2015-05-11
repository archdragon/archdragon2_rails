require 'active_model'
require_relative '../../lib/arch_form/arch_form'
require_relative '../../lib/arch_response/arch_response'
require_relative '../../app/forms/dragon_feeding_form'
require_relative '../../app/models/dragon'
require_relative '../../app/models/food_item'

describe DragonFeedingForm do
  context 'with proper dragon and food' do
    let(:dragon)    { Dragon.new }
    let(:food_item) { FoodItem.new }

    context 'if the dragon didn\'t eat anything today' do
      before do
        expect(dragon).to receive(:feeding_time) { Time.new(1900) }
      end
      it 'informs about success' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(ArchResponse::Success)
      end
    end

    context 'if the dragon ate something today' do
      before do
        expect(dragon).to receive(:feeding_time) { Time.now }
      end
      it 'informs about failure' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(ArchResponse::Error)
      end
    end
  end
end
