class DragonFeedingService < ArchService::Base
  def self.call!(dragon:, foodItem:)
    if !dragon.ate_today?
      return ArchService::Response::Success.new
    else
      return ArchService::Response::Error.new
    end
  end
end
