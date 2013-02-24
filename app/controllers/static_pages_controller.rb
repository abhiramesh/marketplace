class StaticPagesController < ApplicationController
	before_filter :login_required, :only => [:link_accounts, :dashboard]

	def home
	end

	def link_accounts
	end

	def dashboard
	end	

	def test
	end

end
