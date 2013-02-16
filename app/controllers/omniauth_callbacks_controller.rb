class OmniauthCallbacksController < Devise::OmniauthCallbacksController 

	def all
		user = User.from_omniauth(request.env["omniauth.auth"])		
		if user.persisted?
	      sign_in_and_redirect user
	      omniauth = request.env["omniauth.auth"]
	      if omniauth
	      	if omniauth['provider'] == 'twitter'
	      		Service.create(:provider => request.env["omniauth.auth"]['provider'], :uid => request.env["omniauth.auth"]["uid"])
	      	end
	      end
	    else
	      session["devise.user_attributes"] = user.attributes
	      redirect_to new_user_registration_url
	    end
  	end
 
	alias_method :facebook, :all

end
