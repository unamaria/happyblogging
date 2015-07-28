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
	
	# MAKE NSID AVAILABLE

	def get_photos
		method = 'flickr.people.getPublicPhotos'
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&user_id=#{@user_id}&format=#{@format}&nojsoncallback=1"

		response = @conn.get url
		data = JSON.parse(response.body)
		first_photo_id = data['photos']['photo'][0]['id']
	end
	
	def get_photo_info
		method = 'flickr.photos.getInfo'
		photo_id = getPhotos
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&photo_id=#{photo_id}&format=#{@format}&nojsoncallback=1"

		response = @conn.get url
		data = JSON.parse(response.body)
	end
end