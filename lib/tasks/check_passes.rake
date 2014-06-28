desc "check passes"
task :check_passes => :environment do
  Pass.all.each do |pass|
    difference = pass.risetime - Time.now.utc
    # check to see if pass is coming up
      if difference < 20.minutes.to_i && difference > 0 && pass.cards.count < 1
        pass.advance_notify
      end

    # removal temporarily suspended to assist with approval process
      # check to see if pass is old
      #  if difference < 0
      #    pass.destroy
      #  end
  end
end