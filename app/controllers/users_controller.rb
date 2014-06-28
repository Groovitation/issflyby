class UsersController < ApplicationController
  def demo_card
    restriction = 5.minutes

    # clear user's cards to prevent duplicates
    current_user.passes.destroy_all

    if current_user.last_demo_card && (Time.now - current_user.last_demo_card < restriction)
      redirect_to root_url, notice: "You're doing that too much. Wait "+((current_user.last_demo_card + restriction) - Time.now).to_s+"."
    else
      iss = Spacecraft.where(apiname:"ISS").first
      unless iss
        iss = Spacecraft.create(name:"International Space Station", endpoint:"http://api.open-notify.org/iss-pass.json", apiname:"ISS")
      end

      pass = Pass.create(user_id:current_user.id,spacecraft_id:iss.id,risetime:Time.now.utc+7.minutes,demo:true)
      pass.advance_notify
      redirect_to root_url, notice: "Demo card sent to glass."
      current_user.last_demo_card = Time.now
      current_user.save
    end
  end
end
