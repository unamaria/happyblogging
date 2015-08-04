class BlogItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	belongs_to :item, polymorphic: true
	has_and_belongs_to_many :tags, join_table: "taggings"

	def self.items_by_handle(handle)
		BlogItem.joins(:author).where(users: {handle: handle}).order(created_at: :desc)
	end

	def self.items_by_tag(tag)
		BlogItem.joins(:tags).where(tags: {name: tag}).includes(:item).order(created_at: :desc)
	end

	def self.items_by_handle_and_tag(handle, tag)
		BlogItem.joins(:author).where(users: {handle: handle}).joins(:tags).where(tags: {name: tag}).order(created_at: :desc)
	end
end