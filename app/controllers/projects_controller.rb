class ProjectsController < ApplicationController
  def index
    @projects = Post.active
  end
end
