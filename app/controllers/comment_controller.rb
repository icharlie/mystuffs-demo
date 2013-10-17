class CommentController < ApplicationController
  def add
    ticket = Ticket.find(params[:ticket_id])
    comment = ticket.comments.build(context: params[:context])
    if comment.save
      CommentMailer.comment_create(ticket, comment).deliver
      flash[:info] = "Success to add  a comment"
      render json: comment
    else
      flash[:error] = 'Failed to add  a comment'
      render json: comment
    end
  end
  def edit
    comment = Comment.find(params[:id])
    ticket = comment.ticket
    comment.update_attributes(context: params[:context])
    if comment.save
      CommentMailer.comment_create(ticket, comment).deliver
      flash[:info] = "Success to update a comment"
      render json: comment
    else
      flash[:error] = 'Failed to update a comment'
      render json: comment
    end

  end
  def reply
    comment = Comment.find(params[:id])
    reply = comment.reply.build(context: params[:context])
    if reply.save
      CommentMailer.comment_reply(comment, reply).deliver
      flash[:info] = 'Success to reply'
      render json: reply
    else
      flash[:error] = 'Failed to reply'
      render json: reply
    end
  end
end
