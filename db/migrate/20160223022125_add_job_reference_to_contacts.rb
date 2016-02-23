class AddJobReferenceToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :job, index: true, foreign_key: true
  end
end
