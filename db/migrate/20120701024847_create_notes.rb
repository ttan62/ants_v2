class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.string :description
      t.string :user
      t.integer :project_id
      t.integer :note_id
      t.string :content

      t.timestamps
    end
  end
end
