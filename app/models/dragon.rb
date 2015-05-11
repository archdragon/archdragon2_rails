require_relative '../../lib/feeding_time'
require_relative '../../app/models/dragon_hunger'

class Dragon
  attr_accessor :hunger

  def initialize(hunger = DragonHunger.new)
    self.hunger = hunger
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
  def ate_today?
    meal_time = FeedingTime.new(feeding_time)
    meal_time.is_today?
  end
end
