class MediumDetailsController < ApplicationController
	before_action :find_user, only: [:edit, :update, :create]

	def new
		@medium_detail = MediumDetail.new
	end

	def create
		MediumDetail.create(medium_detail_params.merge({user_id: @user.id}))

		redirect_to user_path(@user.handle), notice: "Username added successfully."
	end

	def edit
		@medium_detail = @user.medium_detail
	end

	def update
		medium_detail = @user.medium_detail
		if medium_detail.update(medium_detail_params)
			redirect_to user_path(@user.handle), notice: "Username updated successfully."
		else
			render :edit
		end
	end

	private

	def medium_detail_params
		params.require(:medium_detail).permit(:username)
	end

	def find_user
		@user = User.find_by_handle(params[:user_id])
	end
end