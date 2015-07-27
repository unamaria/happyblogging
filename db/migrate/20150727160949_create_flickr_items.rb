class CreateFlickrItems < ActiveRecord::Migration
  def change
    create_table :flickr_items do |t|
    	t.string :title
    	t.string :photo_id, null: false
    	t.text :description
    	t.datetime :posted_at
    	t.timestamps
    end
  end
end
