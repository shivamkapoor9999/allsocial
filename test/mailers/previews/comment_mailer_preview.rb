# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

	 def comment_email_preview
    CommentMailer.comment_email(Comment.first)
  end
end
