class Service < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :oauth_token, :oauth_secret

  belongs_to :user
end
