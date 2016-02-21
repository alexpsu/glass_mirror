class User < ActiveRecord::Base
  has_many :jobs
  has_secure_password

  def self.confirm(params)
      @user = User.find_by({email: params[:email]})
      @user.try(:authenticate, params[:password])
  end

  def is_authorized?
    current_user == @user
  end
end
