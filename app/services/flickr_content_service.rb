class FlickrContentService
	def self.connection
		@@api_key = ENV['flickr_api_key']
		@@root = 'https://api.flickr.com'
		@@api_path = '/services/rest/?'
		@@format = 'json'
		@@conn = Faraday.new(:url => @@root) do |faraday|
		  faraday.request  :url_encoded             # form-encode POST params
		  faraday.response :logger                  # log requests to STDOUT
		  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
		end
	end
	
	def self.items(user)
		connection
		photo_ids = get_photos(user.flickr_detail.nsid)
		items = photo_ids.map do |photo_id|
			photo_info = get_photo_info(photo_id)['photo']
			{
				title: photo_info['title']['_content'],
				photo_id: photo_id,
				description: (photo_info['description']['_content']).squish,
				posted_at: Time.at(photo_info['dates']['posted'].to_i),
				farm: photo_info['farm'],
				server: photo_info['server'],
				secret: photo_info['secret']
			}
		end
		FlickrItem.process_from_api(user, items)
	end

	def self.flickrID(username)
		connection
		method = 'flickr.people.findByUsername'
		url = "#{@@api_path}method=#{method}&api_key=#{@@api_key}&username=#{username}&format=#{@@format}&nojsoncallback=1"

		response = @@conn.get url
		data = JSON.parse(response.body)
		unless data['state'] == 'fail'
			data['user']['id']
		end
	end

	def self.get_photos(user_id)
		method = 'flickr.people.getPublicPhotos'
		url = "#{@@api_path}method=#{method}&api_key=#{@@api_key}&user_id=#{user_id}&per_page=10&page=1&format=#{@@format}&nojsoncallback=1"
		# &per_page=10&page=1 limit results to 10
		response = @@conn.get url
		data = JSON.parse(response.body)
		data['photos']['photo'].each_with_object([]) { |photo, array| array << photo['id'] }
	end
	
	def self.get_photo_info(photo_id)
		method = 'flickr.photos.getInfo'
		url = "#{@@api_path}method=#{method}&api_key=#{@@api_key}&photo_id=#{photo_id}&format=#{@@format}&nojsoncallback=1"
		response = @@conn.get url
		JSON.parse(response.body)
	end
end