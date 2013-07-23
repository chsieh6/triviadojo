class UserMailer < ActionMailer::Base
  default from: "welcome@triviadojo.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://triviadojo.com/signin'
    mail(to: "charles.hsieh6@gmail.com", subject: 'Welcome to TriviaDojo!')
  end

end
