class JobsController < DashboardController
  def index
    redirect_to "/dashboard"
  end

  def show
    @job = Post.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
