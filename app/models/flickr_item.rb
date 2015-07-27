class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item

	def self.url

	end

	def flickr_id
		
	end
end