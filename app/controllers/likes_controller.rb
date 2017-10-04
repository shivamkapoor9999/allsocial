class LikesController < ApplicationController
	before_action :authenticate_user!, only: [:toggle, :hasLiked]
	def toggle
		if(Like.find_by(user:current_user,likeable_type:params[:type],likeable_id:params[:id].to_i)==nil)
		
		@like=Like.new
		@like.likeable_type = params[:type]
		@like.likeable_id = params[:id].to_i
		@like.user = current_user
		@like.save
		respond_to do |format|
      		format.html
      		format.js #this is needed to handle ajaxified pagination
 		 end
 		else
 			@like = Like.find_by(user:current_user,likeable_type:params[:type],likeable_id:params[:id].to_i)
 			@like.destroy
 		end

	end


end
