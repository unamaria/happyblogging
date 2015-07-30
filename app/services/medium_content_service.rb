class MediumContentService
	def get_posts
		MediumScrapper.new.load_user("uesteibar")
	end
end