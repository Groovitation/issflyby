class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :access_token, :refresh_token, :lat, :long
  validates_presence_of :name
  has_many :passes
  after_create :compare_location!
  require 'geocoder'
  reverse_geocoded_by :lat, :long
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.access_token = auth['credentials']['token']
      user.refresh_token = auth['credentials']['refresh_token']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

  def refresh_access_token(uri,client_id,client_secret)
    if self.refresh_token
      begin
        response = HTTParty.post(uri, :body => {refresh_token: self.refresh_token, client_id: client_id, client_secret: client_secret, grant_type:'refresh_token'})
        if self.access_token = response['access_token']
          self.save
          return true
        end
        return false
      rescue
      end
    end
    return false
  end

  def send_glass_card(card = Hash.new,ding = true)
    # card[:html] ||= "<article class=\'photo\'>\n  <img src=\'https://mirror-api-playground.appspot.com/links/filoli-spring-fling.jpg\' width=\'100%\' height=\'100%\'>\n  <div class=\'photo-overlay\'/>\n  <section>\n <p class=\'text-auto-size\'>Spring Fling Fundraiser at Filoli</p>\n  </section>\n</article>\n"
    card[:bundleId] = "iss_flyby"
    card[:notification] = {level:"DEFAULT"} if ding
    card[:menuItems] = [{action:"DELETE"},{action:"SHARE"},{action:"TOGGLE_PINNED"}]

    begin
      response = HTTParty.post('https://www.googleapis.com/mirror/v1/timeline', body: card.to_json, headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Bearer '+self.access_token })
    rescue
      return false
    end
    return response
  end

  def check_glass_location
    begin
      response = HTTParty.get('https://www.googleapis.com/mirror/v1/locations/latest', headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Bearer '+self.access_token })
      return [response['latitude'],response['longitude']]
    rescue
      # puts "couldn't get glass location"
    end
  end

  def compare_location!
    #call for glass location
    location = self.check_glass_location
    #if new glass location is more than 10000m from database saved coordinates for user (geocoder gem) OR user has no saved location
    if self.distance_from(location, :km) > 10 || self.latitude.nil?
      #destroy all passes for this user
      self.passes.destroy_all
      #get new passes for the user from NASA
      self.check_flyby_time
      #TODO save the new location in the database as the user's location
      self.update(lat: location[0], long: location[1])
    end
  end
  def check_flyby_time
    response = HTTParty.get('http://api.open-notify.org/iss-pass.json?lat='+ self.lat.to_s + '&lon=' + self.long.to_s)['response']
    response.each do |pass|
      Pass.create( risetime: pass['risetime'], duration: pass['duration'], user_id: self.id)
    end
  end

end
