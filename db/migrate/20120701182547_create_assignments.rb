class CreateAssignments < ActiveRecord::Migration

  def change
		create_table :assignments do |t|
  			t.integer :project_id
  			t.integer :note_id
		end

		add_index :assignments, :project_id
		add_index :assignments, :note_id
	
	end
end
