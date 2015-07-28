class RenameFlickrDatumToFlickrDetail < ActiveRecord::Migration
  def change
  	rename_table :flickr_datum, :flickr_details
  end
end
