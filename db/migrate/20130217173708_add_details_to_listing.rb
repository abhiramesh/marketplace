class AddDetailsToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :zipcode, :string
  	add_column :listings, :category, :string
  	add_column :listings, :tags, :string
  end
end
