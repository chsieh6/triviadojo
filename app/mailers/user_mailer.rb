class UserMailer < ActionMailer::Base
  default from: "welcome@triviadojo.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://triviadojo.com/signin'
    mail(to: "@user.email", subject: 'Welcome to TriviaDojo!')
  end

end
