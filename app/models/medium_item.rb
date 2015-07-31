class MediumItem < ActiveRecord::Base
	has_one :blog_item, as: :item, dependent: :destroy

	def author
		blog_item.author
	end

	def self.process_from_api(user, items)
		items.each do |item|
			if user.medium_items.where(url: item[:url]).blank?
				medium_item = MediumItem.create!(
					title: item[:title],
					subtitle: item[:subtitle],
					body: item[:body],
					url: item[:url]
					)
				medium_item.blog_item = BlogItem.create!(user_id: user.id, item_type: 'MediumItem')
			end
		end
	end
end