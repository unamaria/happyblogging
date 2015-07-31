class MediumItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy

	def author
		# TODO: Fix SQL performance
		blog_item.author
	end
end