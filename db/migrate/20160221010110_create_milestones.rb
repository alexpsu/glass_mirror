class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.boolean :status
      t.belongs_to :job

      t.timestamps null: false
    end
  end
end
