class Proposal < ActiveRecord::Base
  attr_accessible :currency, :details, :hourly_rate, :monthly_rate, :monthly_currency, :hourly_currency, :user, :post, :company

  belongs_to :user
  belongs_to :company
  belongs_to :post
end
