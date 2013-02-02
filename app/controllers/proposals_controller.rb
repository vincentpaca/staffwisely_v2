class ProposalsController < DashboardController
  def create
    @proposal = Proposal.new(params[:proposal])
    @proposal.user = current_user
    @proposal.company = current_user.company

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to projects_path, :notice => t("proposals.new.success") }
        format.js { render :json => @proposal, :status => :created }
      else
        format.html { redirect_to project_path(@proposal.post), :alert => t("proposals.new.fail") }
        format.js { render :json => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end
end
