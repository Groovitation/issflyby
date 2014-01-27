class User < ActiveRecord::Base
  require 'geocoder'

  attr_accessible :provider, :uid, :name, :email, :access_token, :refresh_token, :lat, :long, :last_passes_call
  reverse_geocoded_by :lat, :long

  validates_presence_of :name
  after_create :compare_location!
  after_create :subscribe_to_iss

  has_many :passes
  has_many :subscriptions
  has_many :spacecrafts, through: :subscriptions

  def self.create_with_omniauth(auth)
   where(auth.slice(:provider, :uid)).first_or_create do |user|
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
      return HTTParty.post('https://www.googleapis.com/mirror/v1/timeline', body: card.to_json, headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Bearer '+self.access_token })
    rescue
      return false
    end
  end

  def check_glass_location
    begin
      response = HTTParty.get('https://www.googleapis.com/mirror/v1/locations/latest', headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Bearer '+self.access_token })
      return [response['latitude'],response['longitude']]
    rescue
      #puts "couldn't get glass location"
    end
  end

  def subscribe_to_iss
    Spacecraft.where(name:"International Space Station").each do |iss|
      Subscription.create(user_id:self.id,spacecraft_id:iss.id)
    end
  end

  def compare_location!
    #call for glass location
    location = self.check_glass_location
    distance = self.distance_from(location)
    #if new glass location is more than 10000m from database saved coordinates for user (geocoder gem) OR user has no saved location
      if self.lat.blank? || distance > 1000
        #save the new location in the database as the user's location
          self.update(lat: location[0], long: location[1])
        #destroy all passes for this user
          Pass.where(user_id: self.id).delete_all
        #get new passes for the user from NASA
          self.get_spacecraft_passes
      end
  end

  def get_spacecraft_passes
    self.spacecrafts.each do |spacecraft|
      response = HTTParty.get(spacecraft.endpoint + '?lat='+ self.lat.to_s + '&lon=' + self.long.to_s + "&n=100")['response']
      if response
        self.passes.destroy_all
        response.each do |pass|
          Pass.create( risetime: DateTime.strptime(pass['risetime'].to_s,'%s'), duration: pass['duration'], user_id: self.id, spacecraft_id:spacecraft.id)
        end
      end
    end
    #timestamp so we know later if this user needs fresh passes
      self.last_passes_call = Time.now.utc
      self.save
  end

  def timezone
    google = HTTParty.get("https://maps.googleapis.com/maps/api/timezone/json?location="+self.lat.to_s+","+self.long.to_s+"&timestamp="+Time.now.utc.to_i.to_s+"&sensor=true")
    if google
      offset = (google['rawOffset'].to_i + google['dstOffset'].to_i) / 3600
      return ActiveSupport::TimeZone[offset]
    else
      return "Greenwich Mean Time"
    end
  end
end
