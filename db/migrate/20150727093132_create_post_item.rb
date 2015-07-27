class CreatePostItem < ActiveRecord::Migration
  def change
    create_table :post_items do |t|
    	t.references :user
    	t.string :title, null: false
    	t.text :body, null: false
    	t.timestamps
    end
  end
end
