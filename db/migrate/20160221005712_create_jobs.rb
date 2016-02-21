class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :location
      t.string :url
      t.string :discovery
      t.integer :interest_level
      t.text :notes

      t.timestamps null: false
    end
  end
end
