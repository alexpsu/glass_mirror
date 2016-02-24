class AddArchiveToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :archive, :boolean, default: false
  end
end
