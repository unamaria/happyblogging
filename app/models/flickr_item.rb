class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item

	def flickr_url(nsid, photo_id)
		"https://www.flickr.com/photos/#{nsid}/#{photo_id}"
	end

	def direct_url(farm, server, photo_id, secret)
		"https://farm#{farm}.staticflickr.com/#{server}/#{photo_id}_#{secret}_z.jpg"
	end

	def owner_nsid
		FlickrDetail.find_by_user_id(self.blog_item.user_id).nsid
	end
end
