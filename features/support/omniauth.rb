Before('@omniauth_test') do
  OmniAuth.config.test_mode = true
 
  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:google_oauth2] = {
      "provider"=>"google_oauth2",
      "uid"=>"8181138998978630963",
      "user_info"=>{"email"=>"yurigagarin@gmail.com", "first_name"=>"Yuri", "last_name"=>"Gagarin", "name"=>"Yuri Gagarin"}
  }
end
 
After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end