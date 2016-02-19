class UsersController < ApplicationController
  before_action :logged_in?, only: [ :edit, :update, :destroy]
  before_action :logged_out?, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    set_user
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Please check your email: invalid format or already in use."
      redirect_to new_user_path
    end
  end

  def edit
    set_user
    unless current_user == @user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end

  def update
    set_user
    if current_user == @user
      if @user.update_attributes(user_params)
        flash[:notice] = "Successfully updated user info"
        redirect_to user_path(@user)
      else
        flash[:error] = @user.error.full_messages.join(", ")
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    set_user
    if current_user == @user
      @user.destroy
      flash[:notice] = "Successfully deleted user #{@user.last_name}"
      redirect_to users_path
    else
      flash[:notice] = "You can't delete that user silly willy."
      redirect_to user_path(@user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :interest)
    end
end
