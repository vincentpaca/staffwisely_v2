class Post < ActiveRecord::Base
  attr_accessible :contact_details, :description, :requirements, :title, :working_arrangement, :experience, :user, :draft

  belongs_to :user
  has_many :proposals

  validates_presence_of :title, :description, :requirements

  def active
    Post.where(:draft => false)
  end
end
