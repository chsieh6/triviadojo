class ContactMailer < ActionMailer::Base
  default from: "charles.hsieh6@gmail.com"

  def feedback_email(name, email, type, message)
    @name = name
    @email = email
    @type = type
    @message = message
    mail(to: "charles.hsieh6@gmail.com", subject: 'Feedback from ' + name)
  end

  def submit_question(email, category, question, answer)
  	@category = category
    @question = question
    @answer = answer
    mail(to: "charles.hsieh6@gmail.com", subject: 'Thank you for submiting from TriviaDojo')
  end

end
