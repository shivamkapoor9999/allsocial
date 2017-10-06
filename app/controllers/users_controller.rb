class UsersController < ApplicationController
	def edit
		@user=current_user
	end

	def editdone
		@user=current_user
		@user.update(user_params)
		@user.save

		redirect_to posts_path
	end
	def user_params
		params.require(:user).permit(:email,:name,:age,:gender,:password)
	end
end
