class CreateMediumItems < ActiveRecord::Migration
  def change
    create_table :medium_items do |t|
    	t.string :title
    	t.string :subtitle
    	t.text :body
    	t.string :url
    	t.timestamps
    end
  end
end
