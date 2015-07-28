class FlickrContentService

	def initialize
		@api_key = 'b8f714a84f67af6df3b0901e4a3ce803'
		@root = 'https://api.flickr.com'
		@api_path = '/services/rest/?'
		@format = 'json'
		@conn = Faraday.new(:url => @root) do |faraday|
		  faraday.request  :url_encoded             # form-encode POST params
		  faraday.response :logger                  # log requests to STDOUT
		  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
		end
	end

	def flickrID(username)
		method = 'flickr.people.findByUsername'
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&username=#{username}&format=#{@format}&nojsoncallback=1"

		response = @conn.get url
		data = JSON.parse(response.body)
		data['user']['id']
	end

	def get_photos(user_id)
		method = 'flickr.people.getPublicPhotos'
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&user_id=#{user_id}&per_page=10&page=1&format=#{@format}&nojsoncallback=1"
		# &per_page=10&page=1 limit results to 10
		response = @conn.get url
		data = JSON.parse(response.body)
		data['photos']['photo'].each_with_object([]) { |photo, array| array << photo['id'] }
	end
	
	def get_photo_info(photo_id)
		method = 'flickr.photos.getInfo'
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&photo_id=#{photo_id}&format=#{@format}&nojsoncallback=1"
		response = @conn.get url
		JSON.parse(response.body)
	end

	def create_flickr_items(user)
		photo_ids = get_photos(user.flickr_detail.nsid)
		photo_ids.each do |photo_id|
			photo_info = get_photo_info(photo_id)
			flickr_item = FlickrItem.create(
				title: photo_info['title']['_content'],
				photo_id: photo_id,
				description: photo_info['description']['_content'],
				posted_at: photo_info['dates']['posted']
				)
			flickr_item.blog_item = BlogItem.create(user_id: user.id, item_type: 'FlickrItem')
		end
	end
end