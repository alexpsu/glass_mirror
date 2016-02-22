class MilestonesController < ApplicationController
  def new
    @milestone = Milestone.new
  end

  def create
    job = Job.find_by_id(milestone_params[:job_id])
    @milestone = Milestone.new(milestone_params)
    job.milestones << @milestone
    if @milestone.save
      flash[:notice] = "Successfully created milestone"
      redirect_to job_path(job)
    else
      flash[:error] = @milestone.errors.full_messages.join(", ")
      redirect_to new_job_path
    end
  end

  private
    def milestone_params
      params.require(:milestone).permit(:title, :job_id)
    end

end
