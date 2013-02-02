class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @jobs = current_user.posts
  end
end
