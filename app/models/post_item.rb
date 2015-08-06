class PostItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy
	validates :title, :body, presence: true

	def author # check delegate to
		# TODO: Fix SQL performance
		blog_item.author
	end
end