class Proposal < ActiveRecord::Base
  attr_accessible :currency, :details, :hourly_rate, :monthly_rate, :post_id, :user_id
end
