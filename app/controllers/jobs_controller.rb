class JobsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def show
    set_job
  end

  def new
    @Job = Job.new
  end

  def create
    @job = Job.new(job_params)
    current_user.jobs << @job
    if @job.save
      flash[:notice] = "Successfully created job"
      redirect_to job_path(@job)
    else
      flash[:error] = @job.errors.full_messages.join(", ")
      redirect_to new_job_path
    end
  end

  def edit
    set_job
    unless current_user == @job.user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end

  def update
    set_job
    if current_user == @job.user
      if @job.update_attributes(job_params)
        flash[:notice] = "Successfully updated job info"
        redirect_to job_path(@job)
      else
        flash[:error] = @job.error.full_messages.join(", ")
        redirect_to edit_job_path(@job)
      end
    else
      redirect_to job_path(current_job)
    end
  end

  def destroy
    set_job
    if current_user == @job.user
      @job.destroy
      flash[:notice] = "Successfully deleted job #{@job.title}"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "You can't delete that job."
      redirect_to job_path(@job)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company, :title, :location, :url, :discovert, :interest_level, :notes)
    end
end
