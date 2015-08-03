class RemoveActiveToFlickrDetail < ActiveRecord::Migration
  def change
  	remove_column :flickr_details, :active, :boolean
  end
end
