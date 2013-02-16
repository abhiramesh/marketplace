Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'VNCRPsRhk6MpeJRZUHvixg', 'Ynd4XRdP0cezdkVBnTOEvIOaRSFMMIW5HlJeggKFpY' 

  Twitter.configure do |config|
  	config.consumer_key = 'VNCRPsRhk6MpeJRZUHvixg'
  	config.consumer_secret = 'Ynd4XRdP0cezdkVBnTOEvIOaRSFMMIW5HlJeggKFpY'
  end 

end