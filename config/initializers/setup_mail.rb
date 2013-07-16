ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "charles.hsieh6",
  :password             => "John3:30",
  :authentication       => "plain",
  :enable_starttls_auto => true
}