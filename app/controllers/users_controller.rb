class UsersController < ApplicationController
  def demo_card
    unless iss = Spacecraft.where(apiname:"ISS").first
      iss = Spacecraft.create(name:"International Space Station", endpoint:"http://api.open-notify.org/iss-pass.json", apiname:"ISS")
    end
    Pass.new(user_id:current_user.id,spacecraft_id:iss.id,risetime:Time.now+7.minutes).advance_notify
    redirect_to root_url, notice: "Demo card sent to glass."
  end
end