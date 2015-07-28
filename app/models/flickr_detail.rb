class FlickrDetail < ActiveRecord::Base
	belongs_to :user

	def self.flickrID(username)
		prepare_request
		method = 'flickr.people.findByUsername'
		url = "#{@api_path}method=#{method}&api_key=#{@api_key}&username=#{username}&format=#{@format}&nojsoncallback=1"

		response = @conn.get url
		data = JSON.parse(response.body)
		data['user']['id']
	end

	private

	def self.prepare_request
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
end
