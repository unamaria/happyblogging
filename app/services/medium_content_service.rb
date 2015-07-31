class MediumContentService
	def get_posts(username)
		user = MediumScrapper.new.load_user(username)
		user.posts
	end

	def create_medium_items(user)
		posts = get_posts(user.medium_detail.username)
		posts.each do |post|
			medium_item = MediumItem.create(
				title: post.title,
				subtitle: post.subtitle,
				body: post.content,
				url: post.url
				)
			medium_item.blog_item = BlogItem.create(user_id: user.id, item_type: 'MediumItem')
		end
	end		
end