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

  def new
    @job = Post.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @job = Post.new(params[:post])
    @job.user = current_user
    @job.company = current_user.company

    respond_to do |format|
      if @job.save
        format.html { redirect_to "/dashboard", :notice => t("jobs.new.success") }
        format.js { render :json => @job, :status => :created }
      else
        format.html { render :action => "new", :notice => t("jobs.new.success") }
        format.js { render :json => @job.errors, :status => :unprocessable_entity }
      end
    end
  end
end
