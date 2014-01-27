class UsersController < ApplicationController
  def demo_card
  	flyby_time = Time.now.in_time_zone("Central Time (US & Canada)")+7.minutes
	  unless iss = Spacecraft.where(apiname:"ISS").first
      iss = Spacecraft.create(name:"International Space Station", endpoint:"http://api.open-notify.org/iss-pass.json", apiname:"ISS")
    end
    Pass.create(user_id:current_user.id,spacecraft_id:iss.id,risetime:flyby_time.strftime(" at %I:%M %p CST!"),demo:true).advance_notify
    redirect_to root_url, notice: "Demo card sent to glass."
  end
end
