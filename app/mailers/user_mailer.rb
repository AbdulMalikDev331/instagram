class UserMailer < ApplicationMailer
  def send_user_welcome_mail(user)
    @user = user
    @greeting = 'Hi'
    mail(
      from: 'abdulmalik.saghir@devsinc.com',
      to: @user.email,
      subject: 'Welcome To My Instagram Clone'
    )
  end
end
