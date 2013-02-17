class AddMoreImagesToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :image_1, :string
  	add_column :listings, :image_2, :string
  end
end
