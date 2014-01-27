desc "check passes"
task :check_passes => :environment do
  Pass.all.each do |pass|
    difference = pass.risetime - Time.now.utc
    # check to see if pass is coming up
      if difference < 20.minutes && difference > 0
        pass.advance_notify
      end

    # check to see if pass is old
      if difference < 0
        pass.destroy
      end
  end
end