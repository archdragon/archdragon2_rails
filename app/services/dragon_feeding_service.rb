class DragonFeedingService < ArchService::Base
  def self.call!(dragon:, foodItem:)
    return ArchService::Response::Success.new
  end
end
