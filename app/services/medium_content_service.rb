class MediumContentService
	def get_posts(username)
		user = MediumScrapper.new.load_user(username)
		user.posts
	end

	def items(user)
		posts = get_posts(user.medium_detail.username)
		items = posts.map do |post|
			{
				title: post.title,
				subtitle: post.subtitle,
				body: post.content,
				url: post.url
			}
		end
		MediumItem.process_from_api(user, items)
	end		
end