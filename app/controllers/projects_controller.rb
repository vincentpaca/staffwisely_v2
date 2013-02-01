class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :send_proposal ]
  def index
    @projects = Post.includes(:user, :company).active

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
