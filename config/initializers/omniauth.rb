Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], { access_type: "offline", scope: "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/glass.timeline https://www.googleapis.com/auth/glass.location" }
end
