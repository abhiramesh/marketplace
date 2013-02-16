class Listing < ActiveRecord::Base
   attr_accessible :name, :description, :user_id, :image

  belongs_to :user
  mount_uploader :image, ImageUploader
end
