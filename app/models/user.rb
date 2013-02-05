class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company, :company_attributes
  # attr_accessible :title, :body

  after_create :send_welcome_message

  has_many :posts
  has_many :proposals
  belongs_to :company

  accepts_nested_attributes_for :company

  private

  def send_welcome_message
    UserMailer.delay_for(5.minutes).welcome(self.email)
  end
end
