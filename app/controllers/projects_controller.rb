class ProjectsController < ApplicationController
  def index
    @projects = Post.active

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @project = Post.includes(:user).find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
