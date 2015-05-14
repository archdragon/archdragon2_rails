class DragonHunger
  MAX_HUNGER = 100
  MIN_HUNGER = 0

  attr_accessor :hunger_level

  def initialize(hunger_level: MIN_HUNGER)
    self.hunger_level = hunger_level
  end
  def add(points)
    change(points)
  end
  def substract(points)
    change(0 - points)
  end
  def change(points)
    self.hunger_level += points
    self.hunger_level = clamp(@hunger_level)
  end
  def add_from(item)
    change(item.hunger_change)
  end
  def to_i
    self.hunger_level
  end
  def set(level_name)
    self.hunger_level = case level_name
    when :highest_level
      MAX_HUNGER
    when :lowest_level
      MIN_HUNGER
    end
  end
  def clamp(hunger_level)
    hunger_level = MAX_HUNGER if hunger_level > MAX_HUNGER
    hunger_level = MIN_HUNGER if hunger_level < MIN_HUNGER
    hunger_level
  end
end
