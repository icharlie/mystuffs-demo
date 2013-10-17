class RegisterMailer < ActionMailer::Base
  default from: "myawesomestuffs@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.administrator.admin_create.subject
  #
  def user_create(user)
    @user_name = user.email
    @user_password = user.password
    mail(to: user.email, subject: 'Welcome to My Stuff Site')
  end
end
