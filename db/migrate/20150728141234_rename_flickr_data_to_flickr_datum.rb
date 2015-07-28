class RenameFlickrDataToFlickrDatum < ActiveRecord::Migration
  def change
    rename_table :flickr_data, :flickr_datum
  end 
end
