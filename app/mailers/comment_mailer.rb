class CommentMailer < ActionMailer::Base
  default from: "myawesomestuffs@gmail.com"

  def comment_create(ticket, comment)
    @ticket = ticket
    @comment = comment
    @stuff = ticket.stuff
    mail(to: @stuff.user.email, subject: "You have a new comment for #{@stuff.name} on ticekt ##{ticket.id}")
  end

  def comment_reply(comment, reply)
    @comment = comment
    @ticket = comment.ticket
    @stuff = @ticket.stuff
    @reply = reply
    mail(to: @ticket.email, subject: "Owner has replied your comment.")
  end
end
