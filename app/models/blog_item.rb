class BlogItem < ActiveRecord::Base
	belongs_to :author, class_name: 'User', foreign_key: :user_id
	belongs_to :item, polymorphic: true
	has_and_belongs_to_many :tags, join_table: "taggings", dependent: :destroy

	def self.items_by_handle(handle)
		BlogItem.joins(:author).where(users: {handle: handle}).order(created_at: :desc)
	end

	def self.items_by_tag(tag)
		BlogItem.joins(:tags).where(tags: {name: tag}).includes(:item).order(created_at: :desc)
	end

	def self.items_by_handle_and_tag(handle, tag)
		BlogItem.joins(:author).where(users: {handle: handle}).joins(:tags).where(tags: {name: tag}).order(created_at: :desc)
	end

	def tags_to_string
		tags_string = ""
		tags.each do |tag|
			tags_string = tags_string + tag.name + ", "
		end
		tags_string[0...-2]
	end

	def create_or_find_tags(tag_names)
		tag_names.each do |tagname| 
			tag = Tag.find_or_create_by(name: tagname)
			if self.tags.where(name: tagname).blank?
				self.tags << tag
			end
		end
	end
end