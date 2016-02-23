class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)

    #check if you need this because it might use the id when it makes a new one
    @job = Job.find(contact_params[:job_id])
    #you need it for the redirect though or could do contact.job
    @job.contacts << @contact

    if @contact.save
      flash[:notice] = "Successfully created contact"
      redirect_to job_path(@job)
    else
      flash[:error] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end


  def edit
    set_contact
    unless current_user == @contact.job.user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end


  def update
    set_contact
    if current_user == @contact.job.user
      if @contact.update_attributes(contact_params)
        flash[:notice] = "Successfully updated contact info"
        redirect_to job_path(@contact.job)
      else
        flash[:error] = @contact.error.full_messages.join(", ")
        redirect_to edit_contact_path(@contact)
      end
    else
      redirect_to user_path(current_user)
    end
  end


  def destroy
    set_contact
    if current_user == @contact.job.user
      @contact.destroy
      flash[:notice] = "Successfully deleted contact #{@contact.name}"
      redirect_to job_path(@contact.job)
    else
      flash[:notice] = "You can't delete that contact."
      redirect_to user_path(current_user)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :web, :notes, :job_id)
    end
end
