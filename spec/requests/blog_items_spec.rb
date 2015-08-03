require 'rails_helper'
require 'spec_helper'

RSpec.describe "Blog items", type: :request do

	before do
		include Devise::TestHelpers # pass devise validations

		@ramona = User.new
		@ramona.handle = "superramona"
		@ramona.name = "Ramona"
		@ramona.email = Faker::Internet.email
		@ramona.password = 'testtest'
		@ramona.save

		# sign_in @ramona # pass devise validations

		@ramona.flickr_detail = FlickrDetail.create!(username: "unamaria", nsid: "46626331@N07")
		@ramona.medium_detail = MediumDetail.create!(username: "uesteibar")

		flickr_item = FlickrItem.create!(
			:title => "Fredericksburg",
      :photo_id => "17167693465",
    	:description => "Fredericksburg, testing with RSpec",
      :posted_at => Time.current,
      :farm => "8",
      :server => "7606",
      :secret => "b856c21a61"
			)
		@ramona.blog_items << BlogItem.create!(item_id: flickr_item.id, item_type: "FlickrItem")

		medium_item = MediumItem.create!(
			:title => "Medium post",
      :subtitle => "Lorem ipsum dolor sit amet",
    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis numquam odio sunt, accusamus obcaecati provident officia labore consequuntur facilis similique perferendis fugiat officiis tenetur adipisci quod ipsum minima doloremque eius.",
			)
		@ramona.blog_items << BlogItem.create!(item_id: medium_item.id, item_type: "MediumItem")

		post_item = PostItem.create!(
			:title => "Happy post",
    	:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis numquam odio sunt, accusamus obcaecati provident officia labore consequuntur facilis similique perferendis fugiat officiis tenetur adipisci quod ipsum minima doloremque eius.",
			)
		@ramona.blog_items << BlogItem.create!(item_id: post_item.id, item_type: "PostItem")

  end

  describe "GET /:handle" do
    it "returns all kinds of items" do
      get user_index_path(@ramona.handle)
      expect(assigns(:blogitems).count).to eq(3)
    end
  end

  # example:
  # it "displays the user's username after successful login" do
  #   user = User.create!(:username => "jdoe", :password => "secret")
  #   get "/login"
  #   assert_select "form.login" do
  #     assert_select "input[name=?]", "username"
  #     assert_select "input[name=?]", "password"
  #     assert_select "input[type=?]", "submit"
  #   end

  #   post "/login", :username => "jdoe", :password => "secret"
  #   assert_select ".header .username", :text => "jdoe"
  # end

end
