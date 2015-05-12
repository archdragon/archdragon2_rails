class DragonsController < ApplicationController
  def feed
    DragonFeedingForm.call!(
      dragon: Dragon.new(user: User.new),
      food_item: FoodItem.new
    )
  end
end
