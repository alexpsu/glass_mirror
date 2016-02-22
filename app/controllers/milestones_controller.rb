class MilestonesController < ApplicationController
  def new
    @milestone = Milestone.new
  end

  # def create
  #   job = Job.find_by_id(milestone_params[:job_id])
  #   @milestone = Milestone.new(milestone_params)
  #   job.milestones << @milestone
  #   if @milestone.save
  #     flash[:notice] = "Successfully created milestone"
  #     redirect_to job_path(job)
  #   else
  #     flash[:error] = @milestone.errors.full_messages.join(", ")
  #     redirect_to new_job_path
  #   end
  # end

  def edit
    set_job
    unless current_user == @job.user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end


  private
    def set_job
      @job = Job.find(params[:id])
    end

    def milestone_params
      params.require(:milestone).permit(:title, :job_id)
    end

    def job_params
      params.require(:job).permit(:company, :title, :location, :url, :discovert, :interest_level, :notes, milestones_attributes: [:title])
    end

end
