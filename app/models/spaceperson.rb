class Spaceperson < ActiveRecord::Base
  belongs_to :Spacecraft
  attr_accessible :name, :craft
  def self.update_all
  	people = HTTParty.get('http://api.open-notify.org/astros.json')
    puts people
    people['people'].map do |person|
		spaceperson = Spaceperson.find_or_create_by(name:person['name'], craft:person['craft'])
    end
  end
end
