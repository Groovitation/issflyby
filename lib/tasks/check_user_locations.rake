desc "check user locations through Mirror API"
task :check_user_locations => :environment do
  User.all.each do |user|
    user.compare_location!
  end
end