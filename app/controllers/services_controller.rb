class ServicesController < ApplicationController

	def index
	end

	def create
		omniauth = request.env["omniauth.auth"]
	      if omniauth
	      		Service.create(:user_id => current_user.id, :provider => request.env["omniauth.auth"]['provider'], :uid => request.env["omniauth.auth"]["uid"], :oauth_token => request.env["omniauth.auth"].credentials.token, :oauth_secret => request.env["omniauth.auth"].credentials.secret )
	      end
	      redirect_to '/listings/new'
	end

end
