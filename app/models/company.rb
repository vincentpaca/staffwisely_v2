class Company < ActiveRecord::Base
  attr_accessible :address, :description, :name

  has_many :users
  has_many :posts
  has_many :proposals
end
