class Pass < ActiveRecord::Base
	attr_accessible :risetime, :duration, :user_id, :spacecraft_id, :demo
	belongs_to :spacecraft
	belongs_to :user
  has_many :cards, dependent: :destroy

	before_save :sun_permits
  def duration_in_minutes
    return ChronicDuration::output(self.duration.to_i, :format => :long)
  end
	def weather_permits
    #	TODO check for cloudiness at the location and return false if it's cloudy
    begin
      return true if self.demo
      weather = HTTParty.get('http://api.openweathermap.org/data/2.5/find?lat='+self.user.lat.to_s+'&lon='+self.user.long.to_s)
      cloudy_percent = 30
      return weather['list'].first['clouds']['all'].to_i < cloudy_percent
    rescue
      return true
    end
  end

	def sun_permits
    if self.demo
      return true
    end

		if self.user.lat && self.user.long
			# Check to make sure the sun is positioned correctly and return false if not
        rise = Time.at(self.risetime)
        rise_date = Date.new(rise.year,rise.month,rise.day)
        sunrise = SunTimes.new.rise(rise_date, self.user.lat, self.user.long)
        sunrise_comparison = (sunrise.to_f - self.risetime.to_f)
        sunset = SunTimes.new.set(rise_date, self.user.lat, self.user.long)
        sunset_comparison = (self.risetime.to_f - sunset.to_f)
        unless (sunrise_comparison < 30.minutes && sunrise_comparison > 0) || (sunset_comparison < 30.minutes && sunset_comparison > 0)
          return false
        end
			return true
		else
			return false
		end
	end

	def advance_notify
		if weather_permits
      self.spacecraft.spacepeople.each do |sp|
        # TODO must be a way to make these html templates... much cleaner and they could then be reused for the splash page sample card
        if card = self.user.send_glass_card({html:"""
          <article>
            <figure>
              <img style=\"width:240px\" src=\"http://www.issflyby.com/#{sp.name.split("\ ").last.downcase}.jpg\">
            </figure>
            <section>
              #{sp.name} is on board
            </section>
            <footer>ISS Flyby</footer>
          </article>""",isBundleCover:false},false)
          Card.create(pass_id:self.id,mirror_id:card['id'])
        end
      end
      local_risetime = self.risetime.in_time_zone(self.user.timezone)

      if card = self.user.send_glass_card({html:'
        <article class="photo">
          <ul class="mosaic mosaic3">
          <li style="background-image: url(http://www.issflyby.com/iss.jpg)"></li>
          <li style="background-image: url(http://www.issflyby.com/ryazanskiy.jpg)"></li>
          <li style="background-image: url(http://www.issflyby.com/wakata.jpg)"></li>
          </ul>
          <div class="overlay-gradient-tall-dark"/>
          <section>
            <p class="text-auto-size">'+ self.spacecraft.name+ ' flyby coming up '+ local_risetime.strftime(" at %I:%M %p")+'</p>
          </section>
        </article>',isBundleCover:true})
        Card.create(pass_id:self.id,mirror_id:card['id'])

      end
		end
	end
end
#