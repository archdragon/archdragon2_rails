# Dragon feeding time
# Dragons can be fed only once per day, so during comparition
# FeedingTime cares only about D/M/Y
class FeedingTime
  def initialize(time = Time.now)
    @time = time
  end

  def ==(other)
    feeding_timestamp == other.feeding_timestamp
  end

  def feeding_timestamp
    "#{@time.day}-#{@time.month}-#{@time.year}"
  end

  def is_today?
    puts(self.inspect)
    self == self.class.new
  end
end

