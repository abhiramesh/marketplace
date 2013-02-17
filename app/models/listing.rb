class Listing < ActiveRecord::Base
   attr_accessible :name, :description, :user_id, :image

  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
end
