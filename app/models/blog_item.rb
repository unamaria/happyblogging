class BlogItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	belongs_to :item, polymorphic: true

	def content
		if item_type == 'PostItem'
			PostItem.find(item_id)
		end
	end
end