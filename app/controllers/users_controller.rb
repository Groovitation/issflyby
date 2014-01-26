class UsersController < ApplicationController
  def demo_card
    if current_user.send_glass_card({text:"International Space Station is passing over soon! "+(Time.now.utc+7.minutes).to_s,isBundleCover:true})
      redirect_to root_url, notice: "Demo card sent to glass."
    else
      redirect_to root_url, notice: "Demo card could not be sent!"
    end
  end
end