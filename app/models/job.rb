class Job < ActiveRecord::Base
  belongs_to :user
  has_many :milestones, :dependent => :delete_all
  has_many :contacts, :dependent => :delete_all
  accepts_nested_attributes_for :milestones, :reject_if => lambda { |b| b[:title].blank? }


  def sort_mil
    self.milestones.sort {|a, b| a.id <=> b.id}
  end
end
