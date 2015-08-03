class AddActiveToFlickrDetail < ActiveRecord::Migration
  def change
  	add_column :flickr_details, :active, :boolean
  end
end
