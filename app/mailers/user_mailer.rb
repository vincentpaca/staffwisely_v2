class UserMailer < ActionMailer::Base
  default from: '"Harry Arbasa" <harry@staffwisely.com>'

  def welcome(email)
    mail(:to => email, :subject => "Good Call! Welcome to Staffwisely!")
  end
end
