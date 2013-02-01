class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :send_proposal ]
  def index
    if current_user
      @projects = Post.includes(:user, :company).all_except(current_user.company.id)
    else
      @projects = Post.includes(:user, :company).active
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @project = Post.includes(:user, :company).find(params[:id])
    @proposal = Proposal.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def send_proposal
    @project = Post.includes(:user, :company).find(params[:id])
    @proposal = Proposal.new
    render :show
  end
end
