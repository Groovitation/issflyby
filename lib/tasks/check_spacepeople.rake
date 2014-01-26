desc "check spacepeople"
task :check_spacepeople => :environment do
  Spacecraft.all.each do |craft|
    craft.check_spacepeople
  end
end