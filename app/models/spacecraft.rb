class Spacecraft < ActiveRecord::Base
  attr_accessible :name, :lat, :long, :endpoint

  #name used by open-notify.org for spacecraft in API
    attr_accessible :apiname

  validates_presence_of :name
  has_many :passes
  has_many :spacepeople

  #def self.locate_iss
  #  location = HTTParty.get('http://api.open-notify.org/iss-now.json')
  #end
  #
  #def self.update_iss_location
  #	location = HTTParty.get('http://api.open-notify.org/iss-now.json')
  #  iss = Spacecraft.find_or_create_by(name: 'ISS')
  #  iss.update(lat:location['iss_position']['latitude'], long: location['iss_position']['latitude'])
  #end

  def check_spacepeople
    astros = HTTParty.get('http://api.open-notify.org/astros.json?craft=iss')

    if astros
      #remove previous spacepeople
        self.spacepeople.destroy_all

      #create spacepeople
        astros['people'].each do |astro|
          if astro['craft'] == self.apiname
            Spaceperson.create(spacecraft_id:self.id,name:astro['name'])
          end
        end

      #update crew integer
        self.crew = astros['number'].to_i
        self.save
    end
  end

  def fire_laser(lat,lon,intensity)
    #TODO space laser at any place on Earth
  end
end
