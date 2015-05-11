class FeedDragonService
  def self.call!(
    dragon:,
    food_item:,
    removal_service: RemoveItemService
  )
    removal_service.call!(
      user: dragon.owner,
      item: food_item,
      count: 1
    )
    dragon.eat(food_item)
  end
end
