class CommentMailer < ApplicationMailer
	def comment_email(comment_id)
    @comment = Comment.find(comment_id)
    mail(to: @comment.post.user.email, subject: 'Sample Email')   
  end

end
