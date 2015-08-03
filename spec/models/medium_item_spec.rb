require "rails_helper"
require "spec_helper"

RSpec.describe MediumItem, :type => :model do
	before do
		@ramona = User.new
		@ramona.handle = "superramona"
		@ramona.name = "Ramona"
		@ramona.email = Faker::Internet.email
		@ramona.password = 'testtest'
		@ramona.save

		# @ramona.medium_detail = MediumDetail.create!(username: "uesteibar")

		@medium_item = MediumItem.create!(
			:title => "Snoopy",
      :subtitle => "Snoopy and friends",
    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus illum, sequi. Necessitatibus at illo enim nam, unde quas eos doloribus, velit blanditiis tempora delectus quaerat consequatur excepturi totam autem sunt.",
      :url => "https://www.snoopy.com"
			)

		@ramona.blog_items << BlogItem.create!(item_id: @medium_item.id, item_type: "MediumItem")
	end

	describe "#self.process_from_api" do
		before do
			@items = [
				{
					:title => "Garfield",
		      :subtitle => "Garfield and friends",
		    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus illum, sequi. Necessitatibus at illo enim nam, unde quas eos doloribus, velit blanditiis tempora delectus quaerat consequatur excepturi totam autem sunt.",
		      :url => "https://www.garfield.com"
				},
				{
					:title => "Arale",
		      :subtitle => "Arale and friends",
		    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus illum, sequi. Necessitatibus at illo enim nam, unde quas eos doloribus, velit blanditiis tempora delectus quaerat consequatur excepturi totam autem sunt.",
		      :url => "https://www.arale.com"
				}	
			]
			@duplicated_items = [
				{
					:title => "Snoopy",
		      :subtitle => "Snoopy and friends",
		    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus illum, sequi. Necessitatibus at illo enim nam, unde quas eos doloribus, velit blanditiis tempora delectus quaerat consequatur excepturi totam autem sunt.",
		      :url => "https://www.snoopy.com"
				}
			]
		end

		it "creates blog and medium items" do
			MediumItem.process_from_api(@ramona, @items)
			expect(@ramona.blog_items.length).to eq(3)
			expect(@ramona.medium_items.length).to eq(3)
		end

		it "doesn't duplicate entries" do
			MediumItem.process_from_api(@ramona, @duplicated_items)
			expect(@ramona.blog_items.length).to eq(1)
			expect(@ramona.medium_items.length).to eq(1)
		end
	end
	
end