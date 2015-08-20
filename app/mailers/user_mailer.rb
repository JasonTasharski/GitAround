class UserMailer < ApplicationMailer

  default from: "teamgitaround4@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://www.google.com"
    mail(to: @user.email, subject: "test welcome email")
  end
end
