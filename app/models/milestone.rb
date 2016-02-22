class Milestone < ActiveRecord::Base
  belongs_to :job

  def initialize
    @status = true
  end
end
