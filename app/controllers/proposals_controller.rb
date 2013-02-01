class ProposalsController < DashboardController
  def new
   # @proposal = Proposal.new

    respond_to do |format|
      format.html
      format.js
    end
  end
end
