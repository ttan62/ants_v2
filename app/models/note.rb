class Note < ActiveRecord::Base
  attr_accessible :content, :description, :name, :note_id, :project_id, :user
 
  belongs_to :project
  
  def self.search(search)
    search = search.strip
    if search
      find(:all, :conditions [':content or description or name or note_id or project_id or user LIKE ?', "%#{search}%"])
    else 
      find(:all)
    end
  end 
end
