class TicketMailer < ActionMailer::Base
  default from: "myawesomestuffs@gmail.com"

  def ticket_create(ticket)
    @ticket = ticket
    @stuff = ticket.stuff
    mail(to: ticket.email, subject: "Your Ticket for #{ticket.stuff.name}")
  end
  def owner_notify(ticket)
    @ticket = ticket
    @stuff = ticket.stuff
    @user = User.find(@stuff.user_id)
    mail(to: @user.email, subject: "There is a new ticket for #{ticket.stuff.name}")
  end
end
