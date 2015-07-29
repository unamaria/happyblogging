class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item

	def flickr_url(nsid, photo_id)
		"https://www.flickr.com/photos/#{nsid}/#{photo_id}"
	end

	def direct_url(farm_id, server_id, photo_id, secret)
		"https://farm#{farm_id}.staticflickr.com/#{server_id}/#{photo_id}_#{secret}_z.jpg"
	end
end
