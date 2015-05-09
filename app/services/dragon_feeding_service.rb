class DragonFeedingService < ArchService::Base
  def self.call!(dragon: dragon, foodItem: food)
    return ArchService::Response::Success.new
  end
end
