class Note < ActiveRecord::Base
  attr_accessible :content, :description, :name, :note_id, :project_id, :user
 
  belongs_to :project
end
