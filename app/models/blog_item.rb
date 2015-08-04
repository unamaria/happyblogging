class BlogItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	belongs_to :item, polymorphic: true
	has_and_belongs_to_many :tags, join_table: "taggings"
end