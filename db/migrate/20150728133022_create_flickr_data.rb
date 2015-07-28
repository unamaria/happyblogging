class CreateFlickrData < ActiveRecord::Migration
  def change
    create_table :flickr_data do |t|
    	t.references :user
    	t.string :username
    	t.string :nsid
    	t.timestamps
    end
  end
end
