class Job < ActiveRecord::Base
  belongs_to :user
  has_many :milestones, :dependent => :delete_all
  has_many :contacts, :dependent => :delete_all
  accepts_nested_attributes_for :milestones, :reject_if => lambda { |b| b[:title].blank? }

  default_scope {order('updated_at')}


  def find_last
    t_array = []
    self.milestones.each do |mil|
      if mil.status?
        t_array << mil
      end
      t_array.sort! { |a, b| a.id <=> b.id }
    end
    if t_array.length > 0
      return t_array[t_array.length-1]
    else
      return "You haven't dont anything yet."
    end
  end

  def truth_length
    truth_array = []
    self.milestones.each do |mil|
      if mil.status?
        truth_array << mil
      end
    end
    return truth_array.length
  end

end
