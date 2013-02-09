module VenuesHelper

	def distance_display(location)
		if location.country == "GB"
			"#{location.distance.to_f.round(2)} miles"
		else
			"#{(location.distance.to_f * 1.6).round(2)} km"
		end
	end
end
