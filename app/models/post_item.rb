class PostItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item
	def author
		# TODO: Fix SQL performance
		blog_item.author
	end
end