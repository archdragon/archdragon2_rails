require_relative '../../lib/feeding_time'

class Dragon
  def feeding_time
    Time.now
  end
  def ate_today?
    # Dragon can eat once per day
    FeedingTime.new(feeding_time) != FeedingTime.new(Time.now)
  end
end
