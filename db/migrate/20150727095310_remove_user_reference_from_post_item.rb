class RemoveUserReferenceFromPostItem < ActiveRecord::Migration
  def change
  	remove_column :post_items, :user_id, :integer
  end
end
