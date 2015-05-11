# Validates dragon feeding action
class DragonFeedingForm < ArchForm::Base
  attr_accessor :dragon, :food_item

  validate :dragon_didnt_eat_today

  def initialize(dragon:, food_item:)
    self.dragon    = dragon
    self.food_item = food_item
  end

  def submit
    if valid?
      dragon.eat(food_item)
      return ArchResponse::Success.new
    else
      return ArchResponse::Error.new
    end
  end

  def dragon_didnt_eat_today
    errors.add(:dragon, 'has already eaten today') if dragon.ate_today?
  end
end
