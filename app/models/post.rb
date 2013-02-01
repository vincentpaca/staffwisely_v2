class Post < ActiveRecord::Base
  attr_accessible :contact_details, :description, :requirements, :title, :working_arrangement, :experience, :user, :draft, :company

  belongs_to :user
  belongs_to :company
  has_many :proposals

  validates_presence_of :title, :description, :requirements

  def self.active
    Post.where(:draft => false).order("created_at DESC")
  end

  def self.all_except(id)
    Post.where("company_id != ?", id).where(:draft => false).order("created_at DESC")
  end
end
