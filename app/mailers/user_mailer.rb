class UserMailer < ApplicationMailer

  default from: "teamgitaround4@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://wwww.gitaround.herokuapp.com"
    mail(to: @user.email, subject: "Welcome to Git Around")
  end
end
