class Proposal < ActiveRecord::Base
  attr_accessible :currency, :details, :hourly_rate, :monthly_rate, :monthly_currency, :hourly_currency, :user, :post, :company, :post_id

  belongs_to :user
  belongs_to :company
  belongs_to :post

  validates_presence_of :user, :company, :post_id, :details, :monthly_rate, :hourly_rate

  strip_commas_from :monthly_rate, :hourly_rate

  after_create :notify_parties

  private

  def notify_parties
    sender = self.company
    post = self.post
    receiver = post.company

    user_sender = self.user
    user_receiver = receiver.users.first

    ProposalMailer.notify_sender(sender, receiver, post, user_sender, self, user_receiver).deliver
    ProposalMailer.notify_receiver(sender, receiver, post, user_receiver, self, user_sender).deliver
  end
end
