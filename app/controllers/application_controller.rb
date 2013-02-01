class ApplicationController < ActionController::Base
  protect_from_forgery

  def work_arrangements
    WorkingArrangement.all
  end
  helper_method :work_arrangements

  def experiences
    Experience.all
  end
  helper_method :experiences
end
