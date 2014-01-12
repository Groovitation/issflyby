class Spacecraft < ActiveRecord::Base
  attr_accessible :name, :lat, :long
  validates_presence_of :name
  has_many :passes
  has_many :spacepeople

  def self.locate_iss
    location = HTTParty.get('http://api.open-notify.org/iss-now.json')
  end
  
  def self.update_iss_location
  	location = HTTParty.get('http://api.open-notify.org/iss-now.json')
    iss = Spacecraft.find_or_create_by(name: 'ISS')
    iss.update(lat:location['iss_position']['latitude'], long: location['iss_position']['latitude'])
  end

  def fire_laser(lat,lon,intensity)
    #TODO space laser at any place on Earth
  end
end
