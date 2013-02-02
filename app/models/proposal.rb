class Proposal < ActiveRecord::Base
  attr_accessible :currency, :details, :hourly_rate, :monthly_rate, :monthly_currency, :hourly_currency, :user, :post, :company, :post_id

  belongs_to :user
  belongs_to :company
  belongs_to :post

  validates_presence_of :user, :company, :post_id, :details, :monthly_rate, :hourly_rate
end
