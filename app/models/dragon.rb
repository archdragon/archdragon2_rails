require_relative '../../lib/feeding_time'
require_relative '../../app/models/dragon_hunger'

class Dragon
  def initialize
    @hunger = DragonHunger.new
  end
  def feeding_time
    Time.now
  end
  def ate_today?
    # Dragon can eat once per day
    FeedingTime.new(feeding_time) == FeedingTime.new(Time.now)
  end
end
