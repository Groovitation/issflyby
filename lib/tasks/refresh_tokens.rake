desc "refresh access tokens for google accounts"
task :refresh_tokens => :environment do
  #Google        
    User.all.each do |user|
      begin
              user.refresh_access_token("https://accounts.google.com/o/oauth2/token",ENV['OMNIAUTH_PROVIDER_KEY'],ENV['OMNIAUTH_PROVIDER_SECRET'])
      rescue
      end
    end
end