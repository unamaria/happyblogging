class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy

	def author
		blog_item.author
	end

	def flickr_url(nsid, photo_id)
		"https://www.flickr.com/photos/#{nsid}/#{photo_id}"
	end

	def direct_url(farm, server, photo_id, secret)
		"https://farm#{farm}.staticflickr.com/#{server}/#{photo_id}_#{secret}_z.jpg"
	end

	def owner_nsid
		FlickrDetail.find_by_user_id(self.blog_item.user_id).nsid
	end

	def self.process_from_api(user, items)
		items.each do |item|
			if user.flickr_items.where(photo_id: item[:photo_id]).blank?
				flickr_item = FlickrItem.create!(
					title: item[:title],
					photo_id: item[:photo_id],
					description: item[:description],
					posted_at: item[:posted_at],
					farm: item[:farm],
					server: item[:server],
					secret: item[:secret]
					)
				flickr_item.update_attribute(:title, "(no title)") if flickr_item.title.blank? 
				flickr_item.blog_item = BlogItem.create!(user_id: user.id, item_type: 'FlickrItem')
			end
		end
	end
end
