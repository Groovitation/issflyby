class Pass < ActiveRecord::Base
	attr_accessible :risetime, :duration, :user_id
	belongs_to :spacecraft
	belongs_to :user
	before_create :sun_permits

	def weather_permits
		if self.user.lat && self.user.long
			# TODO check for cloudiness at the location and return false if it's cloudy
			return true
		end
	end

	def sun_permits
		if self.user.lat && self.user.long
			# Check to make sure the sun is positioned correctly and return false if not
				require 'sun_times'
	    		sunrise = SunTimes.rise(Date.today, self.user.lat, self.user.long)
	    		sunrise_comparison = (sunrise.to_f - self.risetime.to_f)
	    		sunset = SunTimes.set(Date.today, self.user.lat, self.user.long)
	    		sunset_comparison = (self.risetime.to_f - sunset.to_f)
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
	# 	if sun_permits && weather_permits
	# 		self.user.send_glass_card({text:self.spacecraft.name+" is passing over right now! "+pass.risetime.toString,isBundleCover:true})
	# 		# TODO delete advance_notify card
	# 	end
	# end	

	def advance_notify
		if weather_permits
			self.user.send_glass_card({text:self.spacecraft.name+" is passing over soon! "+pass.risetime.toString,isBundleCover:true})
			self.spacecraft.spacepeople.each do |sp|
				self.user.send_glass_card({text:sp.name+" is on board",isBundleCover:false},false)
			end
		end
	end
end
