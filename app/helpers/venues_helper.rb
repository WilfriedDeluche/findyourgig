module VenuesHelper

  def distance_display(location)
    if I18n.locale == :en
      imperial_distance = location.distance.to_f
      if (imperial_distance) >= 0.75
        "#{imperial_distance.round(2)} miles"
      else
        "#{(imperial_distance * 1760).round} yards"
      end
    else
      metric_distance = (location.distance.to_f * 1.6)
      if metric_distance >= 1
        "#{(metric_distance).round(2)} km"
      else
        "#{(metric_distance * 1000).round} m"
      end
    end
  end
end
