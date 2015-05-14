# Dragon feeding time
# Dragons can be fed only once per day, so during comparition
# FeedingTime cares only about D/M/Y
class FeedingTime
  def initialize(time = Time.now)
    @time = time.beginning_of_day
  end

  def self.today
    new
  end

  def self.tomorrow
    new(Time.now + 1.day)
  end

  def self.yesterday
    new(Time.now - 1.days)
  end

  def to_i
    @time.to_i
  end

  def ==(other)
    feeding_timestamp == other.feeding_timestamp
  end

  def feeding_timestamp
    "#{@time.day}-#{@time.month}-#{@time.year}"
  end

  def is_today?
    self == self.class.new
  end
end

