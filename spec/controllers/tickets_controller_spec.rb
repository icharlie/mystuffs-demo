require 'spec_helper'

describe TicketsController do
  
  let(:stuff_attributes) { FactoryGirl.build(:stuff).attributes }
  let(:ticket_attributes) { FactoryGirl.build(:ticket).attributes }
  
  
  after(:all) do
    User.delete_all
    Stuff.delete_all
    Ticket.delete_all
    Comment.delete_all
  end
  
  before(:all) do
    @user = create(:user)
  end
  
  before (:each) do
    sign_in @user
    @stuff = create( :stuff )
    @ticket = @stuff.tickets.create! ticket_attributes
    @comment = @ticket.comments.create(context: Faker::Lorem.sentence(20))    
  end

	describe "GET new" do
	  it "assings the request ticket as @ticket" do
      comment = @ticket.comments.new
	    get :new, { stuff_id: @stuff }
	    assigns(:ticket).should be_a_new(Ticket)
	  end
	end
  describe "GET show" do
    # before(:each) do
    #   sign_out @user
    # end
    it "should redirect to '/' without token and email" do

      # no tokent
      get :show, {stuff_id: @stuff, id: @ticket}
      response.should redirect_to('/')
    end
    it "should redirect to '/' without email" do
      # no email
      get :show, {stuff_id: @stuff, id: @ticket, token: @ticket.token}
      response.should redirect_to('/')
    end
    it "should redirect to '/' without email" do
      # no token
      get :show, {stuff_id: @stuff, id: @ticket, email: Faker::Internet.email}
    end
    
    it "should redirect to '/' when token is not match" do
      get :show, {stuff_id: @stuff, id: @ticket, token: Faker::Lorem.characters(255), email: Faker::Internet.email}
      response.should redirect_to('/')      
    end
    
    it "should redirect to '/' when email is not match" do
      get :show, {stuff_id: @stuff, id: @ticket, token: @ticket.token, email: Faker::Internet.email}
      response.should redirect_to('/')      
    end
    
    it "should show comment when token and email are correct" do
      get :show, {stuff_id: @stuff, id: @ticket, token: @ticket.token, email: @ticket.email}
      assigns(:ticket).should eql(@ticket)
    end
    
  end
end
