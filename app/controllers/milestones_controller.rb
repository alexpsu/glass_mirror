class MilestonesController < ApplicationController
  def new
    @milestone = Milestone.new
  end

  def create
    job = Job.find_by_id(milestone_params[:job_id])
    @milestone = Milestone.new(title: milestone_params[:title])
    job.milestones << @milestone
    if @milestone.save
      flash[:notice] = "Successfully created milestone"
      redirect_to job_path(job)
    else
      flash[:error] = @milestone.errors.full_messages.join(", ")
      redirect_to new_job_path
    end
  end

  def edit
    set_job
    unless current_user == @job.user
      flash[:notice] = "You can't edit that job"
    end
  end

  def destroy
    set_mil
    @milestone.destroy
    flash[:notice] = "Successfully deleted milestone #{@milestone.title}"
    redirect_to job_path(@milestone.job)
  end


  private
    def set_mil
      @milestone = Milestone.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:id])
    end

    def milestone_params
      params.require(:milestone).permit(:title, :job_id)
    end

end
