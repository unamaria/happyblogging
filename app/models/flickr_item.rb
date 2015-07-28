class FlickrItem < ActiveRecord::Base
	has_one :blog_item, as: :item
	#has_one :author, class_name: 'User', foreign_key: :user_id, as: :item, through: :blog_item

	def flickr_url(flickr_id)
		# https://www.flickr.com/photos/46626331@N07/<%= photo_id %>
	end

	def direct_url
		# from getPhoto: {"id":"17178667303","owner":"46626331@N07","secret":"8bf5e0e924","server":"8707","farm":9,"title":"","ispublic":1,"isfriend":0,"isfamily":0}
		# how does the last value get generated?
		# https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
		# https://farm9.staticflickr.com/8707/<%= photo_id %>_5908ab7d1d_k.jpg
	end
end
