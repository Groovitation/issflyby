class Pass < ActiveRecord::Base
	attr_accessible :risetime, :duration, :user_id
	after_create :schedule_notifications
	belongs_to :spacecraft
	belongs_to :user

	def schedule_notifications
		#TODO schedule a NotificationJob for an advance_notify x minutes prior to the pass, to give users time to organize
		#TODO schedule a NotificationJob for passing_notify to tell users the object should be visible now
	end

	def weather_permitting
		#TODO check for cloudiness at the location and return false if it's cloudy
		return true
	end

	def passing_notify
		if weather_permitting
			self.user.send_glass_card({text:self.spacecraft.name+" is passing over right now!"})
		end
	end	

	def advance_notify
		if weather_permitting
			# TODO risetime - Time.now (convert to minutes, seconds, whatever's appropriate)
			self.user.send_glass_card({text:self.spacecraft.name+" is passing over soon!"})
		end
	end
end
