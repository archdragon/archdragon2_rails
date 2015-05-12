require_relative '../../lib/feeding_time'
require_relative '../../app/models/dragon_hunger'

class Dragon
  attr_accessor :hunger
  attr_accessor :user

  def initialize(user:, hunger: DragonHunger.new)
    self.hunger = hunger
    self.user = user
  end
  def feeding_time
    Time.now
  end
  def eat(food_item)
    hunger.add_from(food_item)
  end
  def owner
    1
  end
  def hunger_level
    hunger.to_i
  end
  def make_hungry!
    hunger.set(:highest_level)
  end
  def satiate!
    hunger.set(:lowest_level)
  end
  def ate_today?
    meal_time = FeedingTime.new(feeding_time)
    meal_time.is_today?
  end
end
