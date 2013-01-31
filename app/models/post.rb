class Post < ActiveRecord::Base
  attr_accessible :contact_details, :description, :requirements, :title
end
