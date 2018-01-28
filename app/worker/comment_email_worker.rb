class CommentEmailWorker
 	@queue = :new_comment_email
 
 
 	def self.perform comment_id 
 
 		puts('******************')
 		puts('inside CommentEmailWorker')
 		CommentMailer.comment_email(comment_id).deliver_now   
 	end
 
 end 