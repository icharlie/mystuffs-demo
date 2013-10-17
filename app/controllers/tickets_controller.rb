class TicketsController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def index
    @stuff = Stuff.find(params[:stuff_id])
    @tickets = @stuff.tickets
  end

  def show
    @stuff = Stuff.find(params[:stuff_id])
    @ticket = Ticket.find(params[:id])
    if user_signed_in?
      if current_user.id != @stuff.user_id
        redirect_to root_path, notice: "You don't have permit to read this ticket"
        return
      end
    else
      if params[:token].nil? || params[:email].nil?
        redirect_to root_path
        return
      end

      if !params[:token].eql?(@ticket.token) || !params[:email].eql?(@ticket.email)
        redirect_to root_path
        return
      end
    end
  end

  def new
    @stuff = Stuff.find(params[:stuff_id])
    @ticket = @stuff.tickets.new
    @ticket.comments.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @stuff = @ticket.stuff
    respond_to do |format|
      if @ticket.save
        TicketMailer.ticket_create(@ticket).deliver
        TicketMailer.owner_notify(@ticket).deliver
        flash[:info] = "Success create your ticket. Please check email"
        format.html { redirect_to action: "show", id: @ticket.id, token: @ticket.token, email: @ticket.email  }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        flash[:error] = "Failed to build a ticket. Please send an email to myawesomestuffs@gmail.com"
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
end
