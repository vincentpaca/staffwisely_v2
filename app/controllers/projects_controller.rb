class ProjectsController < ApplicationController
  def index
    @projects = Job.active
  end
end
