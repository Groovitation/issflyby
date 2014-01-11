desc "check passes"
task :check_passes => :environment do
  Pass.all.each do |pass|
    if (pass.risetime - Time.now) < 20.minutes
    	pass.advance_notify
    	pass.destroy
    end
  end
end