desc "check user locations through Mirror API"
task :check_user_locations => :environment do
  User.all.each do |user|
    user.compare_location!
    if user.passes.count == 0 && ((Time.now.utc - user.last_passes_call) > 1.day)
      user.get_spacecraft_passes
    end
  end
end