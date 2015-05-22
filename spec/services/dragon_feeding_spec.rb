require_relative '../light_helper'

describe FeedDragonService do
  context 'when called with valid dragon and item' do
    let(:dragon)    { Dragon.new(user: User.new) }
    let(:food_item) { FoodItem.new }

    it 'removes the item' do
      removal = spy(RemoveItemService)
      FeedDragonService.call!(
        dragon: dragon,
        food_item: food_item,
        removal_service: removal
      )
      expect(removal).to have_received(:call!) { ArchResponse::Success.new }
    end

    context 'if the dragon is hungry' do
      let(:hungry_dragon) { Dragon.new(user: User.new) }
      before { hungry_dragon.make_hungry! }

      it 'makes it less hungry' do
        hunger_before_feeding = hungry_dragon.hunger_level

        FeedDragonService.call!(
          dragon: hungry_dragon,
          food_item: FoodItem.new
        )

        expect(hungry_dragon.hunger_level).to be < hunger_before_feeding
      end
    end
  end
end
