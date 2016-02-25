class User < ActiveRecord::Base
  has_many :jobs, :dependent => :delete_all
  has_secure_password

  def self.confirm(params)
      @user = User.find_by({email: params[:email]})
      @user.try(:authenticate, params[:password])
  end

  def is_authorized?
    current_user == @user
  end

  def alive
    alive = []
    self.jobs.each do |job|
      if !job.archive?
        alive << job
      end
    end
    return alive.sort! { |a,b| b.updated_at <=> a.updated_at}
  end


  def dead
    dead = []
    self.jobs.each do |job|
      if job.archive?
        dead << job
      end
    end
    return dead.sort! { |a,b| b.updated_at <=> a.updated_at}
  end
end
