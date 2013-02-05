class WelcomeWorker
  include Sidekiq::Worker

  def perform(email)
    UserMailer.welcome(email).deliver
  end
end
