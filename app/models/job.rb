class Job < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :milestones_attributes
  has_many :milestones, :dependent => :delete_all
  accepts_nested_attributes_for :milestones, :reject_if => lambda { |b| b[:title].blank? }
end
