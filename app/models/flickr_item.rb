class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item

	# where to store flickr id?

	def flickr_link_url(flickr_id)
		# https://www.flickr.com/photos/46626331@N07/<%= flickr_item.photo_id %>
	end

	def flickr_content_url
		# https://farm9.staticflickr.com/8707/<%= flickr_item.photo_id %>_5908ab7d1d_k.jpg
	end
end