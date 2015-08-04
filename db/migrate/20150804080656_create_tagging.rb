class CreateTagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
    	t.references :tag
    	t.references :blog_item
    end
  end
end
