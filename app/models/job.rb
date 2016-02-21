class Job < ActiveRecord::Base
  belongs_to :user
  has_many :milestones, :dependent => :delete_all
end
