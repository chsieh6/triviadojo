class ContactMailer < ActionMailer::Base
  default from: "contactus@triviadojo.com"

  def feedback_email(name, email, type, message)
    @name = name
    @email = email
    @type = type
    @message = message
    mail(to: "charles.hsieh6@gmail.com", subject: 'Feedback from ' + name)
  end

end
