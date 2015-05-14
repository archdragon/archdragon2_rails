# Contains logic related to dosplaying dragon data
class DragonPresenter < SimpleDelegator
  def image
    "#{growth_stage}.png"
  end
end
