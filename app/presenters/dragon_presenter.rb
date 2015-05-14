# Contains logic related to dosplaying dragon data
class DragonPresenter < SimpleDelegator
  def image
    "#{element}/#{growth_stage}.png"
  end
  def feeding_countdown_value
    return 0 if can_eat_now?
    next_feeding_time.to_i - feeding_time.to_i
  end
  def feeding_counter
    "<span class='countdown' data-time='#{feeding_countdown_value}'></span>".html_safe
  end
end
