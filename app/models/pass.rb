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
				# require 'sun_times'
	    		sunrise = SunTimes.new.rise(Date.today, self.user.lat, self.user.long)
	    		sunrise_comparison = (sunrise.to_f - self.risetime.to_f)
	    		sunset = SunTimes.new.set(Date.today, self.user.lat, self.user.long)
	    		sunset_comparison = (self.risetime.to_f - sunset.to_f)
	    		unless (sunrise_comparison < 12.hours && sunrise_comparison > 0) || (sunset_comparison < 12.hours && sunset_comparison > 0) 
	    			puts "wrong time"
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
			# TODO restructure for multiple space objects
				# self.user.send_glass_card({text:self.spacecraft.name+" is passing over soon! "+pass.risetime.toString,isBundleCover:true})
			self.user.send_glass_card({text:"ISS is passing over soon! "+pass.risetime.to_s,isBundleCover:true})
			if self.spacecraft 
				self.spacecraft.spacepeople.each do |sp|
					self.user.send_glass_card({text:sp.name+" is on board",isBundleCover:false},false)
				end
			end
		end
	end
end
