class ChangeTypeAttributeFromBlogItem < ActiveRecord::Migration
  def change
  	remove_column :blog_items, :type, :string
  	add_column :blog_items, :item_type, :string
  end
end
