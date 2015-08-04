class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :blog_item
    	t.text :body, null: false
    	t.timestamps
    end
  end
end
