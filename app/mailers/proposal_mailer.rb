class ProposalMailer < ActionMailer::Base
  default from: "hello@staffwisely.com"

  def notify_sender(sender, receiver, post, user, proposal, user_receiver)
    @sender, @receiver, @post, @proposal, @user_receiver = sender, receiver, post, proposal, user_receiver
    mail(:to => user.email, :subject => "Your Proposal Has Been Submitted")
  end

  def notify_receiver(sender, receiver, post, user, proposal, user_sender)
    @sender, @receiver, @post, @proposal, @user_sender = sender, receiver, post, proposal, user_sender
    mail(:to => user.email, :subject => "Proposal Received")
  end
end
