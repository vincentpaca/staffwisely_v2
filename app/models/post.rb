class Post < ActiveRecord::Base
  attr_accessible :contact_details, :description, :requirements, :title, :working_arrangement, :experience, :user

  belongs_to :user
end
