class HomeController < ApplicationController
	def index
		@blogs = User.all
	end
end