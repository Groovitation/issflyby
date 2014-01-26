class Spaceperson < ActiveRecord::Base
  belongs_to :spacecraft
  attr_accessible :name, :spacecraft_id

  def self.update_all
  	people = HTTParty.get('http://api.open-notify.org/astros.json')
    people['people'].map do |person|
    	person['craft'].to_s
    	spacecraft = Spacecraft.find_or_create_by(name: person['craft'].to_s)
    	puts spacecraft
		spaceperson = Spaceperson.find_or_create_by(name:person['name'], craft:person['craft'], spacecraft_id: spacecraft.id)
    end
  end
end
