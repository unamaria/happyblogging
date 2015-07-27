class PostItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	has_one :blog_item, as: :item
end