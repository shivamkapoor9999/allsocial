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

	def deleteprofile
		@user = User.find(params[:id].to_i)
		@user.profile_pic = nil
		@user.save
	end
	
	def user_params
		params.require(:user).permit(:profile_pic,:email,:name,:age,:gender,:password)
	end

	def user_API
		user = User.where("email like ?","%"+params[:term]+"%")
		user_list = []
		user.each do |u|
			user_hash = Hash.new
			user_hash[:id]=u.id
			user_hash[:label]=u.email
			user_hash[:value]=u.email
			user_list << user_hash
		end
		return render json: user_list
	end

	def user_profile
		@user=User.find(params[:id])
	end


end
