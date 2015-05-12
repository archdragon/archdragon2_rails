class DragonController
  def feed
    FeedDragonService.call!(
      dragon:,
      food_item:
    )
  end
end
