class Pass < ActiveRecord::Base
	attr_accessible :risetime, :duration, :user_id
	belongs_to :spacecraft
	belongs_to :user

	def conditions_permit
		require 'SolarEventCalculator'
		if self.user.lat && self.user.long
			# TODO check for cloudiness at the location and return false if it's cloudy
			# Check to make sure the sun is positioned correctly and return false if not
				# TODO still doesn't take time zones into account. Currently all-UTC.
	    		calc = SolarEventCalculator.new(Date.today, self.user.lat, self.user.long)
	    		sunrise = calc.compute_utc_astronomical_sunrise
	    		sunrise_comparison = (sunrise - DateTime.now.utc).to_f * 24 * 60
	    		sunset = calc.compute_utc_astronomical_sunset
	    		sunset_comparison = (DateTime.now.utc - sunset).to_f * 24 * 60
	    		unless (sunrise_comparison < 30.minutes && sunrise_comparison > 0) || (sunset_comparison < 30.minutes && sunset_comparison > 0) 
	    			return false
	    		end
			return true
		else
			return false
		end
	end

	# iced because it doesn't work well with check_passes.rake
	# def passing_notify
	# 	if conditions_permit
	# 		self.user.send_glass_card({text:self.spacecraft.name+" is passing over right now! "+pass.risetime.toString,isBundleCover:true})
	# 		# TODO delete advance_notify card
	# 	end
	# end	

	def advance_notify
		if conditions_permit
			# TODO risetime - Time.now (convert to minutes, seconds, whatever's appropriate)
			self.user.send_glass_card({text:self.spacecraft.name+" is passing over soon! "+pass.risetime.toString,isBundleCover:true})
			self.spacecraft.spacepeople.each do |sp|
				self.user.send_glass_card({text:sp.name+" is on board",isBundleCover:false},false)
			end
		end
	end
end
