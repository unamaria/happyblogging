class HomeController < ApplicationController
	def index
		@blogs = User.all.limit(5)
	end
end