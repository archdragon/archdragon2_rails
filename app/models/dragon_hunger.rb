class DragonHunger
  MAX_HUNGER = 100
  MIN_HUNGER = 0

  def initialize(hunger_level: 0)
    @hunger = hunger_level
  end
  def add(points)
    change(points)
  end
  def substract(points)
    change(0 - points)
  end
  def change(points)
    @hunger += points
    clamp
  end
  def add_from(item)
    change(item.hunger_change)
  end
  def clamp
    @hunger = MAX_HUNGER if @hunger > MAX_HUNGER
    @hunger = MIN_HUNGER if @hunger < MIN_HUNGER
  end
end
