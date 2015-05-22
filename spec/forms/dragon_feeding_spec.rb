require_relative '../light_helper'

describe DragonFeedingForm do
  context 'with proper dragon and food' do
    let(:dragon)    { Dragon.new(user: User.new) }
    let(:food_item) { FoodItem.new }

    context 'if the dragon didn\'t eat anything today' do
      before do
        expect(dragon).to receive(:feeding_time) { FeedingTime.yesterday }
      end
      it 'informs about success' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(ArchResponse::Success)
      end
    end

    context 'if the dragon ate something today' do
      before do
        expect(dragon).to receive(:feeding_time) { FeedingTime.today }
      end
      it 'informs about failure' do
        form = DragonFeedingForm.new(dragon: dragon, food_item: food_item)
        status = form.submit
        expect(status).to be_kind_of(ArchResponse::Error)
      end
    end

  end
end
