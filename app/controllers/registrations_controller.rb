class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, notice: 'Registrations are not open, but if you are interested, email to myawesomestuffs@gmail.com'
  end

  def create
    redirect_to root_path, notice: 'Registrations are not open, but if you are interested, email to myawesomestuffs@gmail.com'
  end
  def update
    @user = User.find(current_user.id)
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      params[:user].delete("current_password")
      if @user.update_attributes(params[:user])
        sign_in @user, bypass: true
        flash[:info] = "Update Profile success"
        redirect_to edit_user_registration_path(@user)
      else
        render "edit"
      end
    else
      if !params[:user][:current_password].blank?
        if @user.valid_password?(params[:user][:current_password])
          params[:user].delete("current_password")
          if @user.update_attributes(params[:user])
            sign_in @user, bypass: true
            # redirect_to after_update_path_for(@user)
            flash[:info] = "Update Profile success"
            redirect_to edit_user_registration_path(@user)
          else
            flash[:error] = "Update Profile failed"
            render "edit"
          end
        else
          @user.errors.add(:current_password, "wrong password")
          render "edit"
        end
      else
        @user.errors.add(:current_password, "can't be blank")
        render "edit"
      end
    end
  end
end
