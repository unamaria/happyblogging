class BlogItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	belongs_to :item, polymorphic: true

	def content(item)
		if item.item_type == 'Post'
			PostItem.find(item.id)
		end
	end
end