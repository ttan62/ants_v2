class CreateProjectSearches < ActiveRecord::Migration
  def self.up
    create_table :project_searches do |t|
      t.string :all
      t.string :name
      t.string :description
      t.string :user
      t.string :tag
      t.timestamps
    end
  end

  def self.down
    drop_table :project_searches
  end
end
