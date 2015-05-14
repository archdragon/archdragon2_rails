# Represents a beast owned by the player..
# Central to the project.
class Dragon
  STAGE_EGG   = 'egg'
  STAGE_YOUNG = 'young'
  STAGE_OLD   = 'old'

  ELEMENT_WATER = 'water'
  ELEMENT_FIRE = 'fire'

  attr_accessor :hunger, :user, :image

  def initialize(user:, hunger: DragonHunger.new)
    self.hunger = hunger
    self.user = user
  end
  def owner
    user
  end
  def growth_stage
    return STAGE_EGG
  end
  def element
    return ELEMENT_WATER
  end

  # Hunger and food
  # move -> concerns ?
  def eat(food_item)
    hunger.add_from(food_item)
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
    feeding_time.is_today?
  end
  def can_eat_now?
    !ate_today?
  end
  def feeding_time
    FeedingTime.today
  end
  def next_feeding_time
    if ate_today?
      FeedingTime.tomorrow
    else
      FeedingTime.today
    end
  end
end
