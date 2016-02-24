class Milestone < ActiveRecord::Base
  belongs_to :job

  default_scope {order('id ASC')}

end
