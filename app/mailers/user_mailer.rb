class UserMailer < ActionMailer::Base
  default from: "harry@staffwisely.com"

  def welcome(email)
    mail(:to => email, :subject => "w00t! Welcome to Staffwisely")
  end
end
