class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    #check if you need this because it might use the id when it makes a new one
    @job = Job.find(contactparams[:job_id])
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
