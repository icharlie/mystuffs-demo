class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @stuffs = Stuff.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 12, order: 'created_at DESC')
    elsif params[:user]
      user = User.find(:first, conditions: {username: params[:user]})
      @stuffs = Stuff.where(user_id: user.id).paginate(page: params[:page], per_page: 12, order: 'created_at DESC')
    else
      @stuffs = Stuff.paginate(page: params[:page], per_page: 12, order: 'created_at DESC')
    end
    respond_to do |format|
      format.html
      format.json {render json:@stuffs}
    end
  end
  def users
    @users = User.paginate(page: params[:page], per_page: 10)
  end
end
