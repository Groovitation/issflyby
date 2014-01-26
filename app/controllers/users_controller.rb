class UsersController < ApplicationController
  def demo_card
  	flyby_time = Time.now.in_time_zone("Central Time (US & Canada)")+7.minutes
    if current_user.send_glass_card({text:"International Space Station flyby coming up! "+ flyby_time.strftime("%I:%M %p") ,isBundleCover:true})
      redirect_to root_url, notice: "Demo card sent to glass."
    else
      redirect_to root_url, notice: "Demo card could not be sent!"
    end
  end
end