require "rails_helper"
require "spec_helper"

RSpec.describe FlickrItem, :type => :model do
	before do
		@ramona = User.new
		@ramona.handle = "superramona"
		@ramona.name = "Ramona"
		@ramona.email = Faker::Internet.email
		@ramona.password = 'testtest'
		@ramona.save

		@ramona.flickr_detail = FlickrDetail.create!(username: "unamaria", nsid: "46626331@N07")

		@flickr_item = FlickrItem.create!(
			:title => "Fredericksburg",
      :photo_id => "17167693465",
    	:description => "Fredericksburg, testing with RSpec",
      :posted_at => Time.current,
      :farm => "8",
      :server => "7606",
      :secret => "b856c21a61"
			)

		@ramona.blog_items << BlogItem.create!(item_id: @flickr_item.id, item_type: "FlickrItem")
	end

	describe "#owner_nsid" do
		it "returns correct nsid" do
			expect(@flickr_item.owner_nsid).to eq("46626331@N07")
		end
	end

	describe "#self.process_from_api" do
		before do
			@items = [
				{
					title: "Lyndon B. Johnson State Park",
					photo_id: "16981508629",
					description: "Lyndon B. Johnson State Park",
					posted_at: Time.current,
					farm: "8",
					server: "7667",
					secret: "fe969ce729"
				},
				{
					title: "Sauer-Beckmann",
					photo_id: "17167684365",
					description: "Sauer-Beckmann Living History Farm",
					posted_at: Time.current,
					farm: "8",
					server: "7606",
					secret: "b856c21a61"
				}	
			]
			@duplicated_items = [
				{
					title: "Fredericksburg",
					photo_id: "17167693465",
					description: "Fredericksburg",
					posted_at: Time.current,
					farm: "8",
					server: "7606",
					secret: "b856c21a61"
				}
			]
		end

		it "creates blog and flickr items" do
			FlickrItem.process_from_api(@ramona, @items)
			expect(@ramona.blog_items.length).to eq(3)
			expect(@ramona.flickr_items.length).to eq(3)
		end

		it "doesn't duplicate entries" do
			FlickrItem.process_from_api(@ramona, @duplicated_items)
			expect(@ramona.blog_items.length).to eq(1)
			expect(@ramona.flickr_items.length).to eq(1)
		end
	end
	
end