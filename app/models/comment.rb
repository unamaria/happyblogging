class Comment < ActiveRecord::Base
	belongs_to :blog_item

	validates :author, :body, presence: true
end