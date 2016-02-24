class Job < ActiveRecord::Base
  belongs_to :user
  has_many :milestones, :dependent => :delete_all
  has_many :contacts, :dependent => :delete_all
  accepts_nested_attributes_for :milestones, :reject_if => lambda { |b| b[:title].blank? }


  def sort_mil
    self.milestones.sort {|a, b| a.id <=> b.id}
  end

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

end

# [t_array.length - 1].title + " on " + time_ago_in_words(t_array[t_array.length - 1].updated_at)
