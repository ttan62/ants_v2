class AddNameToTags < ActiveRecord::Migration
  def up
  	add_column :tags, :name, :string
  	add_column :tags, :project_id, :int
  end

  def down
  	remove_column :tags, :name, :string
  	remove_column :tags, :project_id, :int
  end
end
