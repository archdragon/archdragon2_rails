class DragonsController < ApplicationController
  def feed
    feeding_form = DragonFeedingForm.new(
      dragon: Dragon.new(user: User.new),
      food_item: FoodItem.new
    )
    feeding_form.submit
  end
end
