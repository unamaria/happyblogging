class CreateBlogItem < ActiveRecord::Migration
  def change
    create_table :blog_items do |t|
    	t.references :user
    	t.references :item
    	t.string :type
    	t.timestamps
    end
  end
end
