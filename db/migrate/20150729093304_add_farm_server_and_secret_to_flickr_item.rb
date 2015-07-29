class AddFarmServerAndSecretToFlickrItem < ActiveRecord::Migration
  def change
  	add_column :flickr_items, :farm, :string
  	add_column :flickr_items, :server, :string
  	add_column :flickr_items, :secret, :string
  end
end
